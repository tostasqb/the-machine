Coin.create([
  { name: '1p', value: 0.01, quantity: 10 },
  { name: '2p', value: 0.02, quantity: 10 },
  { name: '5p', value: 0.05, quantity: 10 },
  { name: '10p', value: 0.10, quantity: 10 },
  { name: '20p', value: 0.20, quantity: 10 },
  { name: '50p', value: 0.50, quantity: 10 },
  { name: '£1', value: 1.0, quantity: 10 },
  { name: '£2', value: 2.0, quantity: 10 }
]) if Coin.first.nil?

Product.create([
  { name: 'Cheetos', price: 0.80, quantity: 2 },
  { name: 'Gum', price: 0.40, quantity: 1 },
  { name: 'Water', price: 1.0, quantity: 4 },
  { name: 'Juice', price: 1.35, quantity: 6 }
]) if Product.first.nil?
