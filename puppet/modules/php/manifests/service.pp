class php::service {
    exec { "firewall-cmd" :
        user => 'root',
        cwd => '/root',
        command => '/bin/firewall-cmd --add-service=http --permanent ; /bin/firewall-cmd --permanent --add-port=8080/tcp ; /bin/firewall-cmd --reload',
    }

    service{ 'httpd':
        enable => true,
        ensure => running,
        hasrestart => true,
    }

    service{ 'memcached':
        enable => true,
        ensure => running,
        hasrestart => true,
    }

    service{ 'varnish':
        enable => true,
        ensure => running,
        hasrestart => true,
    }

}
