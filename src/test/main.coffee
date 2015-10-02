
expect = require('chai').expect

{ LineEndingCorrector } = require './../index.coffee'

describe 'LineEndingCorrector', ->

  describe '# __extractOptions()', ->

    it 'existance', ->

      expect(LineEndingCorrector).to.have.property('__extractOptions').that.is.a('function')

    it 'input-output sets', ->

      fn = LineEndingCorrector.__extractOptions

      expect(fn()).to.deep.equal { eolc: 'LF', encoding: 'utf8' }

      expect(fn {}).to.deep.equal { eolc: 'LF', encoding: 'utf8' }

      expect(fn { garbage: 'yes' } ).to.deep.equal { garbage: 'yes', eolc: 'LF', encoding: 'utf8' }

      expect(fn { eolc: 'CRLF' }).to.deep.equal { eolc: 'CRLF', encoding: 'utf8' }

      expect(fn { eolc: null }).to.deep.equal { eolc: 'LF', encoding: 'utf8' }

      expect(fn { eolc: 'Random' }).to.deep.equal { eolc: 'LF', encoding: 'utf8' }

      expect(fn { encoding: null }).to.deep.equal { eolc: 'LF', encoding: 'utf8' }

      expect(fn { encoding: 'UnknownEncoding' }).to.deep.equal { eolc: 'LF', encoding: 'UnknownEncoding' }    

  describe '# __correct()', ->

    fn = LineEndingCorrector.__correct

    it 'existance', ->

      expect(LineEndingCorrector).to.have.property('__correct').that.is.a('function')

    it 'input-output set 1', ->
      
      input = 'Line1\nLine2'
      expectedOutput = 'Line1\nLine2'
      [ wasAltered, output ] = fn input, 'LF'
      expect(wasAltered).to.equal(false)
      expect(output).to.equal(expectedOutput)

    it 'input-output set 2', ->

      input = 'Line1\r\nLine2'
      expectedOutput = 'Line1\nLine2'
      [ wasAltered, output ] = fn input, 'LF'
      expect(wasAltered).to.equal(true)
      expect(output).to.equal(expectedOutput)

    it 'input-output set 3', ->

      input = 'Line1\r\nLine2\r\n\r\n\r\nAnotherLine\nAnotherLine\rSomething\n\n'
      expectedOutput = 'Line1\nLine2\n\n\nAnotherLine\nAnotherLine\nSomething\n\n'
      [ wasAltered, output ] = fn input, 'LF'
      expect(wasAltered).to.equal(true)
      expect(output).to.equal(expectedOutput)


    it 'input-output set 2.1', ->
      
      input = 'Line1\nLine2'
      expectedOutput = 'Line1\r\nLine2'
      [ wasAltered, output ] = fn input, 'CRLF'
      expect(wasAltered).to.equal(true)
      expect(output).to.equal(expectedOutput)

    it 'input-output set 2.2', ->

      input = 'Line1\r\nLine2'
      expectedOutput = 'Line1\r\nLine2'
      [ wasAltered, output ] = fn input, 'CRLF'
      expect(wasAltered).to.equal(true)
      expect(output).to.equal(expectedOutput)

    # it 'input-output set 2.3', ->

    #   input = 'Line1\r\nLine2\r\n\r\n\r\nAnotherLine\nAnotherLine\rSomething\n\n'
    #   expectedOutput = 'Line1\r\r\n\r\nLine2\r\r\n\r\n\r\r\n\r\n\r\r\n\r\nAnotherLine\r\nAnotherLine\r\r\nSomething\r\n\r\n'
    #   [ wasAltered, output ] = fn input, 'CRLF'
    #   expect(wasAltered).to.equal(true)
    #   expect(output).to.equal(expectedOutput)






