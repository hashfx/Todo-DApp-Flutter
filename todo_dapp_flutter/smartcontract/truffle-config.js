export const networks = {
  development: {
    host: "localhost",
    port: 8545,
    network_id: "*",
  },
};
export const contracts_directory = "./contracts";
export const compilers = {
  solc: {
    optimizer: {
      enabled: true,
      runs: 200,
    },
  },
};
export const db = {
  enabled: false,
};