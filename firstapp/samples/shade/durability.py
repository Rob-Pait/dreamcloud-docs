# step-1
import cloudfiles
import random
import string

username = 'username:swift-username'
api_key = 'swift-api-key'

conn = cloudfiles.get_connection(
        username=username,
        api_key=api_key,
        authurl='https://objects.dreamhost.com/auth',
        )

# step-2
container_name = ''.join(random.choice(string.lowercase) for i in range(8))
container = conn.create_container(container_name)
print(container)

# step-3
for container in conn.get_all_containers():
    print(container)

# step-4
file_path = 'goat.jpg'
object_name = 'an amazing goat'
obj = container.create_object(object_name)
obj.load_from_filename(file_path)

# step-5
for obj in container.get_objects():
    print(obj)

# step-6
object = container.get_object(object_name)
print(object)

# step-7
import hashlib
print(hashlib.md5(open('goat.jpg', 'rb').read()).hexdigest())

# step-8
container.delete_object(obj)

# step-9
objects = container.get_objects()
print(objects)

# step-10
container = conn.get_container(container_name)

# step-11
import base64
import cStringIO
import json

import requests

endpoint = 'http://IP_API_1'
params = { 'results_per_page': '-1' }
response = requests.get('%s/v1/fractal' % endpoint, params=params)
data = json.loads(response.text)
for fractal in data['objects']:
    response = requests.get('%s/fractal/%s' % (endpoint, fractal['uuid']), stream=True)
    obj = container.create_object(fractal['uuid'])
    obj.send(iterable=response.iter_content())

for object in container.get_objects():
    print(object)


# step-12
for object in container.get_objects():
    container.delete_object(object)
conn.delete_container(container)

# step-13
file_path = 'goat.jpg'
object_name = 'backup_goat.jpg'
extra = {'meta_data': {'description': 'a funny goat', 'created': '2015-06-02'}}

obj = container.create_object(object_name)
obj.metadata = extra
with open('goat.jpg', 'rb') as iterator:
    obj.send(iterable=iterator)

obj.sync_metadata()

# step-14
# step-15

