module.exports.mapUsers = users => {
  return users
    .map(
      ({ name: { first, last }, email, gender, dob: { date } }) =>
        `('${first}','${last}','${email}','${gender === 'male'}','${date}','${(
          Math.random() * (2.0 - 1.5)+ 1.5).toFixed(2)}')`
    )
    .join(',')
}
