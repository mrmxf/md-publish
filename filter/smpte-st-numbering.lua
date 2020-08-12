-- modified from https://gist.github.com/rauschma/458303094cd87cab077c00c061cce8da
--
-- SMPTE numbering ignores the first 2 heading 1 level paragraphs
--
-- It is advisable to run this filter on all versions of a document, even
-- if only one of them is going to SMPTE. That way the section numbers always agree

-- Ignore headers that have the following text
local headersToIgnore = {
    ["List of Figures"] = true,
    ["List of Listings"] = true,
    ["List of Tables"] = true,
    ["Foreword"] = true,
    ["Introduction"] = true,
    ["Bibliography"] = true,
  }
  
  -- create arrays to manage upto 10 header levels (arrays in LUA start at 1)
  local counters = {};
  local heading_count = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  -- When we get to annexes, we flip this binary value
  local annex_section = false
  -- previous_level is used to reset the count when a new heading has a lower level
  local previous_level=1

  function Header(el)
    local headerPlainText = pandoc.utils.stringify(el)
    if headersToIgnore[headerPlainText] then
      return nil
    end
    if (not annex_section) and (string.find(headerPlainText, "Annex") == 1) then
      annex_section= true
      heading_count[1] = 0
    end
    local level = el.level

    --update the array of counters
    update_counter( level )

    --concatenate all the levels together for output
    if (annex_section) and (level == 1) then
      --Remove the keyword Annex - it is reinserted by the counting filter
      el.content[1].text = ""
    end
    local content = concat( {pandoc.Str( counter_to_prefix( level ) .. " ")},  el.content)
    
    -- remember the level for the next header processing
    previous_level = level

    return pandoc.Header(el.level, content, el.attr)
  end
  
  function insertInto(source, target)
    for _,v in pairs(source) do
      table.insert(target, v)
    end
    return target
  end
  
  function concat(t1, t2)
    local result = {};
    insertInto(t1, result)
    insertInto(t2, result)
    return result
  end

  function update_counter(current_level)
    --if previous_level was shallower, then no counter reset is required
    --if previous_level was deeper then reset deeper counters
  if current_level < previous_level then
      for L= current_level+1, 10 do
        heading_count[L] = 0
      end
      -- set the previous level so the next lines increment properly
      previous_level = current_level
    end
    --regardless of the previous level, we have to increment the current level
    heading_count[current_level] = heading_count[current_level] + 1
  end

  function counter_to_prefix(current_level)
    local result=""
    if(annex_section) then
      --output a letter
      result = "Annex " .. string.char(string.byte("A")-1 + heading_count[1])
    else
      --output a number
      result = tostring(heading_count[1])
    end

    --smpte does not have a trailing dot in its headers
    for L=2, current_level do
      result = result .. "." .. heading_count[L] 
    end

    return result
  end