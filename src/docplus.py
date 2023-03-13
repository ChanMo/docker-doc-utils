import os
import subprocess as sp
from werkzeug.utils import secure_filename
from flask import Flask, request, send_from_directory


app = Flask(__name__)

@app.route("/")
def index():
    return 'Hello You'

@app.route('/uploads/<name>')
def download_file(name):
    return send_from_directory('./uploads/', name)


@app.route("/convert_to/<filetype>", methods=['POST'])
def convert_to_pdf(filetype):
    if filetype not in ['pdf', 'html', 'docx']:
        return {'success':False, 'message':f'{filetype} not support'}

    if 'file' not in request.files:
        return {
            'success': False,
            'message': 'file is required.'
        }

    file = request.files['file']
    print(file)
    filename = f'./uploads/{secure_filename(file.filename)}'
    print(filename)
    file.save(filename)
    res = sp.run(["libreoffice", "--convert-to", filetype, "--outdir", "./uploads", filename], check=True)
    print(res)
    output_file = os.path.splitext(filename)[0] + '.' + filetype
    output_file = output_file[1:]
    return {
        'success': True,
        'output': output_file
    }


app.add_url_rule(
    "/uploads/<name>/",  endpoint='download_file', build_only=True
)

if __name__ == "__main__":
    app.run()
