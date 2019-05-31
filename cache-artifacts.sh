#!/usr/bin/env bash

# Artifacts that are not in brew:

# jboss-bpmsuite-6.4.12.GA-deployable-eap6.x.zip        | http://rcm-guest.app.eng.bos.redhat.com/rcm-guest/staging/jboss-bpmsuite/BPMS-6.4.12.CR1/jboss-bpmsuite-6.4.12.GA-deployable-eap6.x.zip
# jboss-brms-bpmsuite-6.4.12.GA-supplementary-tools.zip | http://rcm-guest.app.eng.bos.redhat.com/rcm-guest/staging/jboss-bpmsuite/BPMS-6.4.12.CR1/jboss-brms-bpmsuite-6.4.12.GA-supplementary-tools.zip

# jboss-eap-6.4.0.zip                                   | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=37393
# jboss-eap-6.4.9-patch.zip                             | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=45371
# jboss-eap-6.4.19-patch.zip                            | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=56031
# jboss-eap-6.4.22-patch.zip                            | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=68441

# javax.json-1.0.4.jar                                  | http://central.maven.org/maven2/org/glassfish/javax.json/1.0.4/javax.json-1.0.4.jar

# rh-sso-7.2.2-eap6-adapter.zip                         | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=57851&product=core.service.rhsso
# rh-sso-7.2.2-saml-eap6-adapter.zip                    | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=57811&product=core.service.rhsso

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
