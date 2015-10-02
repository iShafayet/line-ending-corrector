
class LineEndingCorrector
  
  @defualtEolName: 'LF'

  @eolNameList: [ 'CRLF', 'CR', 'LF' ]

  @__extractOptions: (optionMap)->
    optionMap = {} if not optionMap or typeof optionMap isnt 'object'
    if not ('eolc' of optionMap) or not (optionMap.eolc in LineEndingCorrector.eolNameList)
      optionMap.eolc = LineEndingCorrector.defualtEolName 
    if not ('encoding' of optionMap) or typeof optionMap.encoding isnt 'string'
      optionMap.encoding = 'utf8'
    return optionMap

  @__correct: (content, desiredEolName)->
    if desiredEolName is 'CRLF'
      parts = content.split /\r\n|\n|\r/g
      newContent = parts.join '\r\n'
      return [ (content isnt newContent), newContent ]
    else if desiredEolName is 'LF'
      parts = content.split /\r\n|\n|\r/g
      newContent = parts.join '\n'
      return [ (content isnt newContent), newContent ]
    else if desiredEolName is 'CR'
      parts = content.split /\r\n|\n|\r/g
      newContent = parts.join '\r'
      return [ (content isnt newContent), newContent ]

  @correctSync: (content, optionMap)->
    throw new Error "Expected String" if typeof content isnt 'string'
    { eolc } = LineEndingCorrector.__extractOptions optionMap
    return LineEndingCorrector.__correct content, eolc

@LineEndingCorrector = LineEndingCorrector
