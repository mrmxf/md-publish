# mdpub-readme

## Overview

This document creation system was created because I wanted to be able to type
quickly in markdown on any device and then create a `.docx`, `.pdf`, web page
or `.xml` variant that complies with `JATS` or `NISO-STS`. I wanted to separate
the writing from the document creation so that people could comment using word's
excellent review functionality but publish to multiple platforms complying with
different layout guides from a template. Pandoc is the engine that does this.

Pandoc doesn't do everything, however. Many of my documents cover data structures
and I wanted to read the original data and pull the values into the document in
order to minimise errors.

## Folder structure for using on a computer
### `src/`

The `src/` folder is the usual **source** folder for markdown and image
assets used to construct the document.
