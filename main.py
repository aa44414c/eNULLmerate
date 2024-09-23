#!/usr/bin/python
# Script used to enumerate an external facing domain using various
# methods.  Leverages existing tools and aggregates that data for
# easier digestion by the user.

# Import all required libraries to run this script.
# `os` is used to interact with the operating system running the script.
import os

def domain_enumeration(domain, path):
	# Execute commands to collect information and begin our discovery and
	# enumeration.
	print(f'> Beginning discovery and enumeration of {domain}...')
	# print('> Starting ' + '\x1b[0;33m' + 'Amass' + '\x1b[0m' + '...')
	# os.system(f'/usr/share/scripts/amass_script.sh {domain} {path}')
	# print('> ' + '\x1b[0;33m' + 'Amass' + '\x1b[0m' + 'finished...')
	# print(f'> Storing output at {path}amass.txt...')
	print('> Starting ' + '\x1b[0;33m' + 'Assetfinder' + '\x1b[0m' + '...')
	os.system(f'/usr/share/scripts/assetfinder_script.sh {domain} {path}')
	print('> ' + '\x1b[0;33m' + 'Assetfinder' + '\x1b[0m' + ' finished...')
	print(f'> Storing output at {path}assetfinder_output.txt...')
	
	# Verify the contents of the enumerated information to ensure
	# we are working with live systems.
	print(f'> Accessing output at {path}assetfinder_output.txt and entering into ' + '\x1b[0;33m' + 'Httprobe' + '\x1b[0m' + '...')
	print('> ' + '\x1b[0;33m' + 'Httprobe' + '\x1b[0m' + ' finished...')
	os.system(f'/usr/share/scripts/httprobe_script.sh {path} {path}')
	print(f'> Storing output at {path}httprobe_output.txt...')
	
	# Take the live systems and gather more details on them by
	# using Nikto and Nmap.
	print('> Running ' + '\x1b[0;33m' + 'Nikto' + '\x1b[0m' + ' to gather information on the found sites...')
	os.system(f'/usr/share/scripts/nikto_script.sh {path} {path}')
	print('> ' + '\x1b[0;33m' + 'Nikto' + '\x1b[0m' + ' finished...')
	print(f'> Storing output at {path}nikto_output.txt...')
	print('> Running ' + '\x1b[0;33m' + 'Nmap' + '\x1b[0m' + ' to gather information on the found sites...')
	os.system(f'/usr/share/scripts/nmap_script.sh {path} {path}')
	print('> ' + '\x1b[0;33m' + 'Nmap' + '\x1b[0m' + ' finished...')
	print(f'> Storing output at {path}nmap_output.txt...')
	print(f'> Script has finished...')

def ipaddr_enumeration(ipaddr, path):
	# Passing for now.  This will be added in the future.
	pass
print('''
Are you enumerating a domain or IP address range?

1:  domain
2:  ipaddr
''')
choice = input('\x1b[0;33m' + '- ' + '\x1b[0m')
if choice == '1':
	print(f'> Identify your domain...')
	domain = input('\x1b[0;33m' + '- ' + '\x1b[0m')
	print(f'> Specify your desired output path and directory...')
	path = input('\x1b[0;33m' + '- ' + '\x1b[0m')
	domain_enumeration(domain, path)
elif choice == '2':
	print(f'> Identify your IP address range...')
	ipaddr = input('\x1b[0;33m' + '- ' + '\x1b[0m')
	print(f'> Specify your desired output path and directory...')
	path = input('\x1b[0;33m' + '- ' + '\x1b[0m')
	ipaddr_enumeration(ipaddr, path)
else:
	print('You did not enter the correct information, enter 1 or 2.  Exiting...')
