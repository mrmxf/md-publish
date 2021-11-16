# zmp - Zimple Markup/down Publishing

**z**imple **m**arkdown **p**ublishing - Make html & docx & pdf from md & rst

**md-publish** is a set of tools for Linux for publishing documents
using the [Pandoc] library and other tools. This readme covers installation
for Linux Command Line & web server. The full documentation is pending.

* Status: **Work In Progress**
* Release: **v0.2.x**
* Stable: [**v0.1.0**](https://github.com/mrmxf/md-publish/tree/v0.1.0)

## installation

Make a git for your documents project e.g. `myWorks` & clone it.

```sh
git clone https://github.com/myName/myWorks
```

now add this repo as a subtree in the folder `zmp`.

```sh
git subtree add --prefix=zmp --squash https://github.com/mrmxf/md-publish
```

Now initialise some folders and configs by running the main script:

```sh
zmp/do --init
```

Occasionally update the scripts in the `xr` folder (Linux and Mac only for now) and see if anything is new:

```sh
zmp/do --update
zmp/do --help
```

## usage

You can now explore the source structures for the documents and you can build them by
starting a shell in your document folder and using the command:

* _Linux:_ `zmp/do`

## notes

The linux scripts `do` and `mdpub.sh` perform the same actions. `mdpub.sh` is deprecated.

The `do` and `mdpub.sh` scripts are checked in with `+x` attributes using:

```sh
git update-index --chmod=+x do
```

## recommended folder structure

The folder structure below works quite well and helps to locate content in long complicated documents.
The numbers in the filenames help force the source documents to appear in the same order in a file
browser as they do in the published document.

```text
├─ myWorks                projects folder - the git project root
│  ├─ docs/                   default publishing output folder for the projects
│  ├─ poetry/                 all the sources for the poetry project
│  │  ├─ metadata/
|  |  |  └─ poetry-props.json     metadata for the document
│  │  ├─ tool/                    folder for poetry specific pre & post processing
|  |  ├─ 010-scope.md             1st markdown file in your document
|  |  ├─ 020-intro.md             2nd markdown file in your document
|  |  ├─ 030-body.md              3rd markdown file in your document
|  |  ├─ a00-annex.md             an annex
|  |  ├─ zmp-CONFIG               automation overrides for poetry
|  |  └─ zmp-poetry.yml           pandoc defaults file for poetry
│  ├─ prose/                  all the sources for the prose project
│  ├─ song/                   all the sources for the song project
│  ├─ zmp/                    the smp tooling folder
│  │  ├─ .git/                   git folder (auto-generated) so that you can auto-update the tools
│  │  ├─ boilerplate/            text to be included for different organisations
│  │  ├─ filter/                 Pandoc filters to modify content in an organisation specific way
│  │  ├─ preproc/                Pandoc preprocessor tools
│  │  ├─ refdoc/                 Pandoc reference docs for `.docx` creation
│  │  ├─ do-tools/               All the tools run by `do`
│  │  ├─ template/               Pandoc default templates for different formats
│  │  ├─ template-init/          The sample document project that gets clones with mdpub --init
│  │  ├─ _SETTINGS               environment variables - copy & edit in src folder
│  │  └─ do                      the command that makes your documents
|  └─ .gitignore              controls what you check into your document repo
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

## Tips & Trick for markdown

### Getting extensions to work

In the [Pandoc] documentation, you will find many extensions that allow
`multiline_tables`, `grid_tables`, `task_lists` amd other parametric ways
to make visually stunning documents. To enable these, update the `to:`
field of your defaulta file.

original:

```yaml
from: markdown
```

extensions modified:

```yaml
from: markdown+multiline_tables+task_lists-blank_before_header
```

* turn _on_: `multiline_tables`
* turn _on_: `task_lists`
* turn **off**: `blank_before_header`

[Mr MXF]:https://mrmxf.com
[Pandoc]:https://pandoc.org
[pandoc-templates]:https://github.com/jgm/pandoc-templates
[protext]:https://www.tug.org/protext/
[mactex]:https://tug.org/mactex/