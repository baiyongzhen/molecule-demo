"""Role testing files using testinfra."""

"""
def test_nginx_package(host):
    p = host.package('nginx')
    assert p.is_installed
    assert p.version.startswith("1.18")
"""

import pytest

@pytest.fixture
def host_os(host):
    return host.system_info.distribution

def test_nginx_installed(host, host_os):
    if host_os == 'ubuntu':
        p = host.package("nginx")
        assert p.is_installed
        assert p.version.startswith("1.18")
    elif host_os == 'amzn':
        p = host.package("nginx")
        assert p.is_installed
        assert p.version.startswith("1.24")
