# IMKL 2.3 to IMKL 3 Transformation

## Introduction

This Node.js module provides an XSLT-based transformation to convert IMKL 2.3 XML files into IMKL 3.0 format. It automates most of the conversion process but requires some manual adjustments for specific elements.

## Installation

To use this module, first install the required dependencies:

```sh
npm install
```

This will install `xslt3` for XSLT transformations.

## Usage

Run the transformation script using:

```sh
npx xslt3 -xsl:xslt/imkl23_to_imkl3.xslt -s:path/to/source.xml -o:path/to/output.xml
```

### Parameters:

- `-s` → Path to the IMKL 2.3 XML file.
- `-o` → Path where the transformed IMKL 3.0 XML file will be saved.

Example:

```sh
npm run transform --source=./data/input.xml --output=./data/output.xml
```

## Limitations

The script automates most of the conversion process, but some manual adjustments are required. All of these mandatory adjustments will be indicated in the output via an XML comment starting with `WARNING -`.

### Coordinate System

The output will include [Lambert2008](http://spatialreference.org/ref/epsg/3812/) as srsName for all geometries. However, the transformation does not change the actual coordinates. You need to manually convert coordinates to **Lambert2008**.

### beginLifespanVersion

This new element in IMKL 3.0 is automatically assigned a default value. The correct value needs to be entered manually in the output.

### Language Strings

The transformation assumes that all text values in the input XML are in **Dutch**. If they are in another language, you must update the locale accordingly.

---

For any issues or improvements, please submit a pull request or open an issue in the repository.
