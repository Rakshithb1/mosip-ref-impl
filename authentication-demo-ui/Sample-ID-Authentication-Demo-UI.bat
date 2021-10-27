REM Note: Use -Dfinger.device.subid=1 to support fingerprint slab device. For single fingerprint authentication that argument can be removed
REM Note: -Dfile.encoding="UTF-8" is needed for using UTF-8 data in demographic auth and to view UTF-8 data in EKYC response data
java -Dida.request.captureFinger.deviceId=<finger.device.id> -Dida.request.captureIris.deviceId=<iris.device.id> -Dida.request.captureFace.deviceId=<face.device.id> -Dmosip.base.url=<ida-base-url> -DmispLicenseKey=<misp.license.key> -DpartnerId=<partner.id> -DpartnerOrg=<partner.organization> -DpartnerApiKey=<partner.api.key> -Dfinger.device.subid=<finger.device.subid> -Dfile.encoding="UTF-8" -jar ./target/authentication-demo-ui-1.2.0-SNAPSHOT.jar