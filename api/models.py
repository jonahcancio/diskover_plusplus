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
	name = models.CharField(max_length=50)
	image = models.CharField(max_length=260, blank=True, null=True)
	url = models.CharField(max_length=50, blank=True, null=True)
	marker = models.CharField(max_length=260, blank=True, null=True)
	routeMarker = models.CharField(max_length=260, blank=True, null=True)
	routeColor = models.CharField(max_length=7, blank=True, null=True)
	class Meta:
		db_table = 'category'

class Location(models.Model):
	"""This class and its functions wrap around the 'location' table in the
	Diskover's underlying database.
	"""
	name = models.CharField(max_length=100)
	description = models.TextField(blank=True, null=True)
	more_info = models.TextField(blank=True, null=True)
	lat = models.FloatField()
	lng = models.FloatField()
	url = models.CharField(max_length=100, blank=True, null=True)
	category = models.ForeignKey(Category, models.DO_NOTHING, blank=True, null=True)
	
	class Meta:
		db_table = 'location'

class Image(models.Model):
	""""""
	location = models.CharField(max_length=100, blank=False)
	img_url = models.CharField(max_length=260, primary_key=True, unique=True, blank=False)
	class Meta:
		db_table = 'image'

class Subarea(models.Model):
    sub = models.OneToOneField(Location, related_name='subareas', on_delete=models.CASCADE, primary_key=True)
    building = models.ForeignKey(Location, related_name='building', on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'subarea'
