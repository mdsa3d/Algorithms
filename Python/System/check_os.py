import sys

def get_platform():
    platforms = {
        'linux1' : 'Linux',
        'linux2' : 'Linux',
        'darwin' : 'OS X',
        'win32' : 'Windows'
    }
    if sys.platform not in platforms:
        return sys.platform
    
    return platforms[sys.platform]

"""
How it works:
- The function first creates a platforms dictionary of the most common operating system values returned by sys.platform.
- If the value returned by sys.platform is not found in the dictionary, the value itself is returned.
- Otherwise, a friendly name for the operating system retrieved from the platforms dictionary is returned.
"""