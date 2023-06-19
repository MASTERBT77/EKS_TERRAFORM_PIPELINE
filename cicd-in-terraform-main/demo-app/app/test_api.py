import unittest
from helloworld_api import app

class ApiTest(unittest.TestCase):
    # Check App returns HTTP 200
    def test_health(self):        
        test_client = app.test_client(self)
        response = test_client.get("/health")
        self.assertEqual(response.status_code, 200)
        self.assertTrue(b'Hello, I am healthy!' in response.data) 

    # Check App returns JSON response
    def test_content_type(self):        
        test_client = app.test_client(self)
        response = test_client.get("/")
        self.assertEqual(response.content_type, "application/json")

    # Check for valid  jason key in response
    def test_content_key(self):        
        test_client = app.test_client(self)
        response = test_client.get("/")
        self.assertTrue(b'Message' in response.data)

    # Check for valid  jason value in response
    def test_content_value(self):        
        test_client = app.test_client(self)
        response = test_client.get("/")
        self.assertTrue(b'Hello, World!' in response.data) 

if __name__ == "__main__":
    unittest.main()




