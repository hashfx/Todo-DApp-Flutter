module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },
    advanced: {
      websocket: true,
    },
  },
  contracts_directory: "./contracts",
  contract_build_directory: "./build/contracts/",
  compilers: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};