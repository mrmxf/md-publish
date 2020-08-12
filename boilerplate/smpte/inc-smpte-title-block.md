---
_help: >
  This template is for the **Title block** for SMPTE documents.
  The template inherits other
  metadata from the parent as follows.

  `doc_name` full document name e.g. AG-04-ST:2020

  `doc_type` full document type e.g. SMPTE STANDARD

  `doc_title` markdown text of the title e.g. Standard Template

  `doc_date` the date of approval as YYYY-MM-DD

  `doc_year` the year of approval as YYYY

---
::: {custom-style=smpte-pandoc-doc-name-title}
**SMPTE {{ doc_name }}**
:::

::: {custom-style=smpte-pandoc-doc-type}
{{ doc_type }}
:::

::: {custom-style=smpte-pandoc-doc-title}
[{{ doc_title }}]{.class smpte-pandoc-doc-title}
:::
