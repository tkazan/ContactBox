from django.conf.urls import url
from .views import *


app_name = 'contactbox'
urlpatterns = [
    url(r'^$', home, name='home'),

]