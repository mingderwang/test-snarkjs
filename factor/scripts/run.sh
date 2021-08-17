circom circuit.circom --r1cs --wasm --sym
snarkjs r1cs info circuit.r1cs
snarkjs r1cs print circuit.r1cs circuit.sym
snarkjs info -c circuit.json
snarkjs printconstraints -c circuit.json\n\n
snarkjs printconstraints  --help
snarkjs r1cs info circuit.r1cs
snarkjs r1cs print circuit.r1cs circuit.sym
//snarkjs groth16 prove --help 
// mkdir snarkjs_example && cd snarkjs_example
snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v
snarkjs powersoftau contribute pot12_0001.ptau pot12_0002.ptau --name="Second contribution" -v -e="some random text"\n
snarkjs powersoftau export challenge pot12_0002.ptau challenge_0003\nsnarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"\nsnarkjs powersoftau import response pot12_0002.ptau response_0003 pot12_0003.ptau -n="Third contribution name"\n
snarkjs powersoftau verify pot12_0003.ptau\n
snarkjs powersoftau beacon pot12_0003.ptau pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"\n
snarkjs powersoftau prepare phase2 pot12_beacon.ptau pot12_final.ptau -v\n
snarkjs r1cs print circuit.r1cs circuit.sym
snarkjs powersoftau verify pot12_0003.ptau\n
cd ../snarkjs_example
snarkjs powersoftau verify pot12_0003.ptau\n
snarkjs powersoftau prepare phase2 pot12_beacon.ptau pot12_final.ptau -v\n
// Start a new powers of tau ceremony and make a contribution\n\nsnarkjs powersoftau new bn128 12 pot12_0000.ptau -v\nsnarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v
snarkjs powersoftau verify pot12_0003.ptau\n
snarkjs powersoftau verify pot12_0001.ptau\n
snarkjs powersoftau contribute pot12_0001.ptau pot12_0002.ptau --name="Second contribution" -v -e="some random text"\n
snarkjs powersoftau export challenge pot12_0002.ptau challenge_0003\nsnarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"\nsnarkjs powersoftau import response pot12_0002.ptau response_0003 pot12_0003.ptau -n="Third contribution name"\n
snarkjs powersoftau beacon pot12_0003.ptau pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"\n
snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v
// Start a new zkey and make a contribution\n\nsnarkjs zkey new circuit.r1cs pot12_final.ptau circuit_0000.zkey\nsnarkjs zkey contribute circuit_0000.zkey circuit_final.zkey --name="1st Contributor Name" -v
snarkjs zkey export verificationkey circuit_final.zkey verification_key.json
snarkjs powersoftau verify pot12_final.ptau\nsnarkjs zkey verify circuit.r1cs pot12_final.ptau circuit_final.zkey
//
snarkjs r1cs info circuit.r1cs
//
snarkjs zkey verify
// input.json is {"a": 3, "b": 11}
snarkjs wtns calculate circuit.wasm input.json witness.wtns
snarkjs groth16 prove circuit_final.zkey witness.wtns proof.json public.json
snarkjs groth16 verify verification_key.json public.json proof.json
snarkjs zkey export solidityverifier circuit_final.zkey verifier.sol
snarkjs generatecall
