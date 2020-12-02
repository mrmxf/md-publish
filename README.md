# md-publish

e**X**ternal **R**esource (**xr**) that power the Mr MXF md-publish system.

**md-publish** is a set of tools for Windwows, Mac & Linux for publishing documents
using the [Pandoc] library. Although [Pandoc] by itself is excellent, there are some
limitations when you want to make a technical document in web, .docx and .pdf formats.

Status: **Work In Progress**

## installation

Make a folder for your documents project e.g. `/my-document`. Alternativly, you can
get started with a sample documents project that I use to test all the scripts.

```sh
git clone --depth=1 https://github.com/mrmxf/md-publish-samples
```

Now `cd` into your project folder e.g. `cd /my-document` or
`cd ./md-publish-samples` and shallow clone this repo into a subfolder. I
call the folder `xr` (external resources) so that it's at the bottom
of the folder list and nice and short when typing.

```sh
git clone --depth=1 https://github.com/mrmxf/md-publish xr
```

## usage

Once you have your document project, you might want to make a file called `.gitignore`
that tells git not to store temp files and the like. My default `.gitignore` is here:
`https://github.com/mrmxf/md-publish-samples/blob/master/.gitignore`

You can now explore the source structures for the documents and you can build them by
starting a shell in your document folder and using the command:

* _Linux:_ `xr/mdpub.sh`
* _Mac:_ `zsh xr/mdpub.sh`
* _Windows:_ `.\xr\mdpub.bat`

## recommended folder structure

The folder structure below works quite well and helps to locate content in long complicated documents.
The numbers in the filenames help force the source documents to appear in the same order in a file
browser as they do in the published document.

```text
├─ my-document-folder         document folder - contains coy of all files
│  ├─ docs/                   default output folder for the documents
│  ├─ src/                    all the sources for doc1
│  │  ├─ metadata/
|  |  |  └─ doc-properties.json      metadata for the document
│  │  ├─ tool/                    folder for pre & post processing
|  |  ├─ 010-scope.md             1st markdown file in your document
|  |  ├─ 020-intro.md             2nd markdown file in your document
|  |  ├─ 030-body.md              3rd markdown file in your document
|  |  ├─ a00-annex.md             an annex
|  |  ├─ mdpub-content.yml        pandoc control file - see CONFIG for automation
│  ├─ src-doc2/               all the sources for doc2
│  ├─ src-doc3/               all the sources for doc3
│  ├─ xr/                    the tools from this repo
│  │  ├─ .git/                   git folder (auto-generated) so that you can auto-update the tools
│  │  ├─ boilerplate/            text to be included for different organisations
│  │  ├─ filter/                 Pandoc filters to modify content in an organisation specific way
│  │  ├─ refdoc/                 Pandoc reference docs for `.docx` creation
│  │  ├─ template-tools/         Sample pre & post processing scripts
│  │  ├─ templates-default/      Pandoc default templates for different formats
│  │  ├─ templates-default/      Pandoc default templates for different formats
│  │  ├─ _SETTINGS               environment variables - copy & edit in src folder
│  │  ├─ mdpub-update-tools.sh   script to update tools from this repo
│  │  ├─ mdpub.sh                make your documents (Win)
│  │  └─ mdpub.sh                make your documents (Mac & Linux)
|  └─ .gitignore              prevents you from checking the tools into your document repo
```

## Background

This repository contains templates & tools for making technical documentation
with [pandoc]. It is intended for users wishing to make sophisticated
documents for trade associations and standards bodies. It is understood
that many participants will want to use word and Acrobat for document
review but many authors want to use somthing more sophisticated to
create .docx .pdf .html and .epub content from the same sources.

The default templates are synced with the [pandoc-templates] repo. The
boilerplate and tools are custom for the organisations in which I work.

### Build requirements

To build new output documents you will need to install a few bits of open source softwrae:

* [Pandoc] is the core engine for building asll the outputs. It is a command line application. Fire up a terminal (Win/Mac/Linux) and type `pandoc --version` to see if you have it installed.
* One of the following for making PDF output:
  * [Protext] is needed for generating a Latex intermediate for creating PDFs on Windows
  * [Mactex] is needed for making PDFs on a Mac

A better pre-processing envioroment is being worked on to allow better
inclusion of source files and references within [Pandoc].

[Mr MXF]:https://mrmxf.com
[Pandoc]:https://pandoc.org
[pandoc-templates]:https://github.com/jgm/pandoc-templates
[protext]:https://www.tug.org/protext/
[mactex]:https://tug.org/mactex/