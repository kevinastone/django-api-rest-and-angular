#!/usr/bin/env python3

from setuptools import setup, find_packages


# Shamelessly stolen (then modified) from https://github.com/cburgmer/pdfserver/blob/master/setup.py
def parse_requirements(file_name):
    import re
    requirements = []
    for line in open(file_name, 'r').read().split('\n'):
        if re.match(r'(\s*#)|(\s*$)', line):
            continue
        # if re.match(r'\s*-e\s+', line):
        m = re.search(r"(git(?:\+\w{3})?|https?|svn)://.+#egg=(.*)$", line)
        if m:
            # FIXME: Can't install packages from source repos right now
            if 'http' in m.group(1):
                # Distutils can install Http served packages right now
                # FIXME: Skip this now
                # requirements.append(m.group(2))
                pass
            pass
        elif re.match(r'\s*-f\s+', line):
            pass
        elif re.match(r'\s*-i\s+', line):
            pass
        else:
            requirements.append(line)

    return requirements


def parse_dependency_links(file_name):
    import re
    dependency_links = []
    for line in open(file_name, 'r').read().split('\n'):
        if re.match(r'\s*-[ef]\s+', line):
            dependency_links.append(re.sub(r'\s*-[ef]\s+', '', line))
            continue
        m = re.search(r"((?:git(?:\+ssh)|http|svn)://.+#egg=.*)$", line)
        if m:
            dependency_links.append(m.group(1))

    return dependency_links

params = dict(
    name='API Example',
    packages=find_packages(),
    install_requires=parse_requirements('requirements.txt'),
    dependency_links=parse_dependency_links('requirements.txt'),
    entry_points={
        'console_scripts': [
        ]
    },
)

setup(**params)
