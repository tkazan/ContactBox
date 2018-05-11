from django.conf.urls import url
from .views import *


app_name = 'contactbox'
urlpatterns = [
    url(r'^$', home, name='home'),
    url(r'^new$', NewPersonView.as_view(), name='new'),
    url(r'^show/(?P<id>(\d)+)$', show_person, name='person'),
    url(r'^modify/(?P<id>(\d)+)$', ModifyPersonView.as_view(), name='modify'),
    url(r'^delete/(?P<id>(\d)+)$', DeletePersonView.as_view(), name='delete'),
    url(r'^groups$', GroupsView.as_view(), name='groups'),
    url(r'^groups/modify/(?P<id>(\d)+)$', ModifyGroupView.as_view(), name='modify-groups'),
    url(r'^groups/delete/(?P<id>(\d)+)$', DeleteGroupView.as_view(), name='delete-groups'),
]