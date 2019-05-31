#!/usr/bin/env bash

# Artifacts that are not in brew:

# jboss-eap-6.4.9-patch.zip          | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=45371
# jboss-eap-6.4.19-patch.zip         | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=56031
# jboss-eap-6.4.22-patch.zip         | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=68441
# rh-sso-7.2.2-eap6-adapter.zip      | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=58101
# rh-sso-7.2.2-saml-eap6-adapter.zip | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=58061

# Artifact that is in brew, but the md5 sum lookup is returning a bad (404) artifact url:
# https://brewweb.engineering.redhat.com/brew/buildinfo?buildID=410568

# javax.json-1.0.4.jar (200) | http://download.eng.bos.redhat.com/brewroot/vol/rhel-7/packages/org.glassfish-javax.json/1.0.4/1/maven/org/glassfish/javax.json/1.0.4/javax.json-1.0.4.jar
# javax.json-1.0.4.jar (404) | http://download.devel.redhat.com/brewroot/packages/org.glassfish-javax.json/1.0.4/1/maven/org/glassfish/javax/json/1.0.4/javax.json-1.0.4.jar

D="${1:-.}"
for Z in \
    jboss-eap-6.4.9-patch.zip \
    jboss-eap-6.4.19-patch.zip \
    jboss-eap-6.4.22-patch.zip \
    javax.json-1.0.4.jar \
    rh-sso-7.2.2-eap6-adapter.zip \
    rh-sso-7.2.2-saml-eap6-adapter.zip \
; do
    F="${D}/${Z}"
    if [ -e "${F}" ] ; then
        sha256=$(sha256sum "${F}" | awk '{ print $1 }')
        sha1=$(sha1sum "${F}" | awk '{ print $1 }')
        md5=$(md5sum "${F}" | awk '{ print $1 }')
        cekit-cache add "${F}" --sha256 ${sha256} --sha1 ${sha1} --md5 ${md5}
    else
        echo "can't cache "${F}" - file missing"
    fi
done
