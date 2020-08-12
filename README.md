# md-publish

Tools, templates & boilerplate for publishing technical documents from markdown by
[Mr MXF](https://mrmxf.com)
using the
[Pandoc] library.

## installation

Make a folder for your documents project e.g. `/my-standard`

Now shallow clone this repo into your document folder into a subfolder. I
usually call the folder `x-r` (external resources) so that it's at the bottom
of the folder list.

```sh
git clone --depth=1 https://github.com/mrmxf/md-publish x-r
```

## usage

Get started with the sample documents project that I use to test all the scripts.

```sh
git clone --depth=1 https://github.com/mrmxf/md-publish-samples
```

Once you have cloned the sample folder, perform the `md-publish` installation above.
Note that the sample documents project has a `.gitignore` file to separate the tools from the docs.

You can now explore the source structures for the documents and you can build them by
starting a shell in your document folder and using the command:

* _Linux:_ `bash x-r/bin/makedocs.sh`
* _Mac:_ `zsh x-r/bin/makedocs.sh`
* _Windows:_ `x-r/bin/makedocs.bat`

## recommended folder structure

The folder structure below works quite well and helps to locate content in long complicated documents.
The numbers in the filenames help force the source documents to appear in the same order in a file
browser as they do in the published document.

```text
├─ my-document-folder         document folder - contains coy of all files
│  ├─ docs/                   default output folder for the documents
│  ├─ src-doc1/               all the sources for doc1
|  |  ├─ 010-scope.md             1st markdown file in your document
|  |  ├─ 020-intro.md             2nd markdown file in your document
|  |  ├─ 030-body.md              3rd markdown file in your document
|  |  ├─ a00-annex.md             an annex
|  |  └─ ymldg-defaults.yml       pandoc control file - must start with ymldg to be automated
│  ├─ src-doc2/               all the sources for doc2
│  ├─ src-doc3/               all the sources for doc3
│  ├─ x-r/                    the tools from this repo
│  │  ├─ .git/                   git folder (auto-generated) so that you can auto-update the tools
│  │  ├─ bin/                    tools to automate build and install
│  │  ├─ boilerplate/            text to be included for different organisations
│  │  ├─ filter/                 Pandoc filters to modify content in an organisation specific way
│  │  ├─ refdoc/                 Pandoc reference docs for `.docx` creation
│  │  └─ templates-default/      Pandoc default templates for different formats
|  └─ .gitignore              prevents you from checking the tools into your document repo
```

## Background

This repository contains templates & tools for making technical documentation
with [pandoc]. It is intended for users wishing to make sophisticated
documents for trade associations and standards bodies. It is understood
that many participants will want to use word and Acrobat for document
review but many authors want to use somthing more sophisticated to
create .docx .pdf .html and .epub conten from the same sources.

The defaul templates are synced with the [pandoc-templates] repo. The
boilerplate and tools are custom for the organisations in which I work.
