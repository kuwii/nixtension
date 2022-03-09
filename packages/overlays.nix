[(final: prev: {
  nixt = {
    microsoft-edge = prev.callPackage (import ./microsoft-edge).stable {};
    microsoft-edge-beta = prev.callPackage (import ./microsoft-edge).beta {};
    microsoft-edge-dev = prev.callPackage (import ./microsoft-edge).dev {};
  };
})]
