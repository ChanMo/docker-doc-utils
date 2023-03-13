# Documents Utils

## Usage

Make sure `libreoffice` is installed.

Install docplus

```
pip install --user docplus
```

Run API Servier

```
python -m docplus
```

## APIs

### Format Convert

use httpie, convert to pdf
```
  http POST -f :5000/convert_to/pdf file@~/demo.docx
```

use httpie, convert to html
```
  http POST -f :5000/convert_to/html file@~/demo.docx
```
