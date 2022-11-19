    // Document
// - user id
//  - created at
// - title
// contents

const mongoose = require('mongoose');

const documentSchema = mongoose.Schema({
  uid: {
    required: true,
    type: String,
  },
  createdAt: {
    required: true,
    type: Number,
  },
  title: {
    required: true,
    type: String,
    trim: true,
  },
  content: {
    type: Array,
  }
});

module.exports = documentSchema;