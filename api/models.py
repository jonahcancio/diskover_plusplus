from django.db import models

# Create your models here.
class Administrator(models.Model):
	"""This class and its functions wrap around the 'administrator' table in the
	application's underlying database.
	"""
	firstname = models.CharField(max_length=30, blank=False)
	lastname = models.CharField(max_length=20, blank=False)
	username = models.CharField(max_length=15, primary_key=True, unique=True, blank=False)
	password = models.CharField(max_length=200, blank=False)
	status = models.BooleanField(default=True, blank=False)
	class Meta:
		db_table = 'administrator'
	
	def setPassword(self, password):
		"""For purposes of security, a user's password is never stored in the database.
		Using Werkzeug's password hash generator, we can generate a password's hash
		to encrypt it in such a manner that it cannot be plausibly decrypted. It is
		this hash that is stored in the raw password's stead.
		"""
		self.password = generate_password_hash(password)

	def checkPassword(self, password):
		"""This method checks if a user's input password, upon hashing, matches the
		corresponding value in the database (with the input username serving as the
		search argument in the database).
		"""
		"""return check_password_hash(self.password, password)"""

	@property
	def is_active(self):
		"""This property method returns the status of the Administrator object in the
		database. Whether or not an admin is allowed access to Diskover's administrator
		functionalities depends on this status.
		"""
		return self.status

	def get_id(self):
		"""This method is currently unused. It returns the username of an Administrator
		instance cast as a string.
		"""
		return str(self.username)

class Category(models.Model):
	"""This class and its functions wrap around the 'category' table in the
	Diskover's underlying database.
	"""
	name = models.CharField(max_length=50, primary_key=True, unique=True, blank=False)
	image = models.CharField(max_length=260, blank=False)
	position = models.IntegerField(blank=False)
	url = models.CharField(max_length=50, blank=False)
	marker = models.CharField(max_length=260, blank=False)
	routeMarker = models.CharField(max_length=260, blank=False)
	routeColor = models.CharField(max_length=7, blank=False)
	class Meta:
		db_table = 'category'

class Location(models.Model):
	"""This class and its functions wrap around the 'location' table in the
	Diskover's underlying database.
	"""
	id = models.IntegerField(primary_key=True)
	name = models.CharField(max_length=100, unique=True, blank=False)
	category = models.CharField(max_length=50, blank=False)
	description = models.TextField(blank=False)
	moreInfo = models.TextField(blank=False)
	lat = models.FloatField(blank=False)
	lng = models.FloatField(blank=False)
	url = models.CharField(max_length=100, blank=False)
	class Meta:
		db_table = 'location'

class Inside(models.Model):
	"""This class and its functions wrap around the 'inside' table in the
	Diskover's underlying database. This python class/PostgreSQL table
	keeps relationships between rooms and their parent buildings.
	"""
	room = models.CharField(max_length=100, primary_key=True, unique=True, blank=False)
	building = models.CharField(max_length=100, blank=False)
	class Meta:
		db_table = 'inside'

class Image(models.Model):
	""""""
	location = models.CharField(max_length=100, blank=False)
	img_url = models.CharField(max_length=260, primary_key=True, unique=True, blank=False)
	class Meta:
		db_table = 'image'
