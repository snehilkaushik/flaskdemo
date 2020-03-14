from app import application
import unittest

class BasicTests(unittest.TestCase):
    
    def setUp(self):
        self.app = application.test_client()
    def test_main_page_status_code(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
    def test_home_data(self):
        response = self.app.get('/')
        self.assertEqual(response.data, b"Hello World Again!")

 
if __name__ == "__main__":
    unittest.main()
