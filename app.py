from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_cloud():
    return 'Eu João Evangelista consegui usar IaC na DigitalOcean na disciplina de Gerência de Configuração - UFC Quixadá'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
