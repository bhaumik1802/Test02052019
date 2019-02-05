#!/usr/bin/python

from flask import Flask, request, jsonify
from flask_restful import Resource, Api


app = Flask(__name__)
api = Api(app)

status = [
    {   "version": "1.0",
        "description" : "pre-interview technical test",
        "lastcommitsha": "abc57858585"
}
]

class Helloworld(Resource):
    def get(self):
        return 'Hello World'

class Healthcheck(Resource):
    def get(seff):
        return jsonify(status)
    

api.add_resource(Helloworld, '/')

api.add_resource(Healthcheck, '/healthcheck')

if __name__ == '__main__':
     app.run(host = '0.0.0.0', port='5002')
