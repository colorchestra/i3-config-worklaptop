#!/usr/bin/python3

from icinga2api.client import Client
import os
import urllib3
urllib3.disable_warnings()

# source variables from secret.py
exec(compile(source=open('secret').read(),filename='secret', mode='exec'))

client = Client(url, apiuser, apipass)

data = client.status.list('CIB')

sum_services_critical = data['results'][0]['status']['num_services_critical']
sum_services_warning = data['results'][0]['status']['num_services_warning']
sum_services_ok = data['results'][0]['status']['num_services_ok']
print("💚  " + str(int(sum_services_ok)) + "  ⚠️  " + str(int(sum_services_warning)) + " ‼️  " + str(int(sum_services_critical)))
