"""
Hello World sample API
"""
import json
from flask import Flask
from flask_restful import Api, Resource

app = Flask(__name__)
api = Api(app)

class Health(Resource):
    """ Example Health Class """
    @classmethod
    def get(cls):
        """ health endpoint for api """
        return json.dumps({"Message":"Hello, I am healthy!"})

class HelloWorld(Resource):
    """ base endpoint for helloworld api """
    @classmethod
    def get(cls):
        """ get endpoint for helloworld api """
        return json.dumps({"Message":"Hello, World!"})

api.add_resource(Health, "/health")
api.add_resource(HelloWorld, "/")

if __name__ == "__main__":
    app.run(debug=True)
