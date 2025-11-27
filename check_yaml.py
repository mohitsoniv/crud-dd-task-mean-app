import yaml, sys

try:
    yaml.safe_load(open('docker-compose.yml'))
    print('YAML OK')
except Exception as e:
    print('YAML ERROR:', e)
    sys.exit(1)
