
class LineEndingCorrector
  
  @defualtEolName: 'LF'

  @eolCharacterMap:
    'CRLF': { string: '\r\n', regex: /\r\n/g }
    'CR': { string: '\r', regex: /\r(?!\n)/g }
    'LF': { string: '\n', regex: /\n/g }

  @eolNameList: [ 'CRLF', 'CR', 'LF' ]

  @__extractOptions: (optionMap)->
    optionMap = {} if not optionMap or typeof optionMap isnt 'object'
    if not ('eolc' of optionMap) or not (optionMap.eolc in LineEndingCorrector.eolNameList)
      optionMap.eolc = LineEndingCorrector.defualtEolName 
    if not ('encoding' of optionMap) or typeof optionMap.encoding isnt 'string'
      optionMap.encoding = 'utf8'
    return optionMap

  @__correct: (content, desiredEolName)->
    wasAltered = false
    desiredEolString = LineEndingCorrector.eolCharacterMap[desiredEolName].string
    for name in LineEndingCorrector.eolNameList
      character = LineEndingCorrector.eolCharacterMap[name]
      continue if desiredEolName is name
      if -1 < content.indexOf character.string
        wasAltered = true
        content = content.replace character.regex, desiredEolString
    return [ wasAltered, content ]

  @correctSync: (content, optionMap)->
    throw new Error "Expected String" if typeof content isnt 'string'
    { eolc } = LineEndingCorrector.__extractOptions optionMap
    return LineEndingCorrector.__correct content, eolc


@LineEndingCorrector = LineEndingCorrector
