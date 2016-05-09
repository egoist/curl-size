import test from 'ava'
import execa from 'execa'

test('infer by header', async t => {
  const {stdout} = await execa('./main.sh', ['http://fontawesome.io/assets/font-awesome-4.6.1.zip'])
  t.is(stdout, '9 KB')
})

test('infer by downloading whole file', async t => {
  const {stdout} = await execa('./main.sh', ['https://cdnjs.cloudflare.com/ajax/libs/systemjs/0.19.23/system.js'])
  t.true(stdout.indexOf('Be patient, downloading the file') !== -1)
  t.true(stdout.indexOf('54 KB') !== -1)
})
