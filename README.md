# puppet-webupd8-oracle-java
Puppet module to manage the installation of the [WebUpd8 Oracle Java Installer PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/java). This installs the Oracle JDK.

**NOTE:** By using this module you will automatically accept the [Oracle license agreement](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) for Java SE.

### Getting started
To install the current version of Java 8 simply add the following to your manifest:
``` puppet
include webupd8_oracle_java
```

You can also adjust a few basic parameters for the package, for example, to ensure the latest version of Oracle Java 7 is installed:
```puppet
class { 'webupd8_oracle_java':
  ensure  => 'latest',
  version => '7'
}
```

### Limitations
This module does not manage `update-alternatives`. The WebUpd8 packages do update `update-alternatives` with newly installed Java versions but it is up to the user to set the priorities of these versions. As such, managing multiple versions of Java is left up to the user.

### Compatibility
This module has been tested for installing Java 8 on Ubuntu 14.04. It should work for other versions of Java and other versions of Ubuntu given that a package exists for your setup in the WebUpd8 PPA.
