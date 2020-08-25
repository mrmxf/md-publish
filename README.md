# md-publish

Tools, templates & boilerplate for publishing technical documents from markdown by
[Mr MXF](https://mrmxf.com)
using the
[Pandoc] library.

Status: **Work In Progress**

## installation

Make a folder for your documents project e.g. `/my-document`. Alternativly, you can
get started with a sample documents project that I use to test all the scripts.

```sh
git clone --depth=1 https://github.com/mrmxf/md-publish-samples
```

Now `cd` into your project folder e.g. `cd /my-document` or
`cd ./md-publish-samples` and shallow clone this repo into a subfolder. I
call the folder `x-r` (external resources) so that it's at the bottom
of the folder list and nice and short when typing.

```sh
git clone --depth=1 https://github.com/mrmxf/md-publish x-r
```

## usage

Once you have your document project, you might want to make a file called `.gitignore`
that tells git not to store temp files and the like. My default `.gitignore` is here:
``

You can now explore the source structures for the documents and you can build them by
starting a shell in your document folder and using the command:

* _Linux:_ `bash x-r/makedocs.sh`
* _Mac:_ `zsh x-r/makedocs.sh`
* _Windows:_ `x-r/makedocs.bat`

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
|  |  ├─ zmdpub-doc1.yml          pandoc control file - see CONFIG for automation
|  |  ├─ zmdpub-doc1.xtra         a list of extra assets to be processed during document build
|  |  └─ zmetadata.json           metadata for automated substitution - dates, versions etc
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

### Build requirements

To build new output documents you will need to install a few bits of open source softwrae:

* [Pandoc] is the core engine for building asll the outputs. It is a command line application. Fire up a terminal (Win/Mac/Linux) and type `pandoc --version` to see if you have it installed.
* One of the following for making PDF output:
  * [Protex] is needed for generating a Latex intermediate for creating PDFs on Windows
  * [Mactex] is needed for making PDFs on a Mac
* [Python] is needed for metadata substitution used in SMPTE templates
* [pip] is needed to load the metadata substitution engine once [Python] is installed

There are scripts for Mac, Windows and Linux in the `/bin` folder. These should be run from the root folder e.g.

* **Make output documents**
  * Windows: `bin\makedocs.win.bat`
  * Mac: `bin/makedocs.mac.sh`
  * Linux: `bin/makedocs.lx.sh`
* **Install Filters**
  * Windows: `bin\install-filters.bat` (not working yet)
  * Linux: `bin\install-filters.sh`
  * ... to install the following:
    * [mustache](https://github.com/michaelstepner/pandoc-mustache) for pandoc

More scripts will follow as it becomes prettier and other outputs are generated
