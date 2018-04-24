from django.conf.urls import url
from .views import *


app_name = 'contactbox'
urlpatterns = [
    url(r'^$', home, name='home'),
    url(r'^new$', NewPersonView.as_view(), name='new'),
    url(r'^show/(?P<id>(\d)+)$', ShowPersonView.as_view(), name='person'),
    url(r'^modify/(?P<id>(\d)+)$', ModifyPersonView.as_view(), name='modify'),
    url(r'^delete/(?P<id>(\d)+)$', DeletePersonView.as_view(), name='delete'),

]