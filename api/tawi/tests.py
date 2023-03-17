from django.test import TestCase
from django.contrib.auth.models import User

class AnimalTestCase(TestCase):
    def setUp(self):
        User.objects.create_user(username="user1", password="roar2022!")

    def test_user_can_be_created(self):
        """Users can be created"""
        user1 = User.objects.get(username="user1")
        self.assertEqual(user1.username, 'user1')
