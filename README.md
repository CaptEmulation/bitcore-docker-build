# My bitcore docker build

This is a docker build of bitcore + insight + wallet service.  This container is running on testnet at [bitcore.soapbubble.online/insight](https://bitcore.soapbubble.online/insight)

I am using many `@captemulation` namespaced bitcore packages to do this.

 - [@captemulation/bitcore-node](https://github.com/CaptEmulation/bitcore-node)
 - [@captemulation/bitcore-message](https://github.com/CaptEmulation/bitcore-message)
 - [@captemulation/bitcore-p2p](https://github.com/CaptEmulation/bitcore-p2p)
 - [@captemulation/bitcore-wallet-service](https://github.com/CaptEmulation/bitcore-wallet-service)
 - [@captemulation/insight-api](https://github.com/CaptEmulation/insight-api)
 - [@captemulation/insight-ui](https://github.com/CaptEmulation/insight-ui)

 I forked these repos for the following reasons:

  - Refactored bitcore stack to useing `peerDependencies` for `bitcore-lib` rather than relying on the runtime check
  - Modifies `bitcore-wallet-service` to support passing in the `mongodb` url as an ENV parameter to support docker link container
  - Other modifications to point packages to the namespaced versions
  
