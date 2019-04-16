from django.db import models
from django.db import connection
# Create your models here.


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

    def __str__(self):
        return self.name
    
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
    category = models.ForeignKey(
        Category, models.DO_NOTHING, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'location'

    @classmethod
    def reset_id_sequence(cls):
        reset_value = cls.objects.order_by('pk').last().id + 1
        with connection.cursor() as cursor:
            cursor.execute("ALTER SEQUENCE location_id_seq RESTART WITH %s", [reset_value])

class Image(models.Model):
    """"""
    location = models.CharField(max_length=100, blank=False)
    img_url = models.CharField(
        max_length=260, primary_key=True, unique=True, blank=False)

    class Meta:
        db_table = 'image'


class Subarea(models.Model):
    sub = models.OneToOneField(
        Location, related_name='building', on_delete=models.CASCADE, primary_key=True)
    building = models.ForeignKey(
        Location, related_name='subareas', on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.sub.name
        
    class Meta:
        db_table = 'subarea'


class Tag(models.Model):
    name = models.CharField(max_length=30)
    location = models.ManyToManyField(Location, related_name='tags')

    def __str__(self):
        return self.name
        
    class Meta:
        db_table = 'tag'
