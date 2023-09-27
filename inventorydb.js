// create collections
db.createCollection('users')
db.createCollection("admins")
db.createCollection('customers')
db.createCollection('categories')
db.createCollection('items')
db.createCollection('orders')
db.createCollection('orderitems')

// insert records into user entity
db.users.insertOne({ _id: 1, first_name: 'emmanuel', last_name: 'adeyemi', username:'K-Honsu', email: 'feranmia51@gmail.com', password:'1234567890', created_at: Date()});
db.users.insertOne({ _id: 2, first_name: 'emmanuella', last_name: 'setphen', username:'ellah', email: 'ellah12@gmail.com', password:'0978563412', created_at: Date()});

// insert records into categories entity
db.categories.insertOne({_id: 1, name: 'tech', created_at: Date()})
db.categories.insertOne({_id: 2, name: 'fashion', created_at: Date()})

// update user record
db.users.update(
  { _id: 1, },
  { $set: { first_name: 'jerry', last_name: 'uke' } } 
);
// update category record
db.categories.update(
    { _id: 1, },
    { $set: { name: 'beauty-products'} } 
  );


// get data based on table (users) record
db.users.find({ _id: 1 })

db.categories.findOne({ _id: 1 })

// delete user
db.users.deleteOne(
    { _id: 1, } 
  );

db.users.deleteOne(
    { _id: 2, } 
  );

  // delete categories
db.categories.deleteOne(
    { _id: 2, } 
  );
