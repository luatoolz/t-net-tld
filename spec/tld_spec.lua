describe("tld", function()
	local t, is, tld
	setup(function()
    t = require "t"
    is = t.is
    tld = t.net.tld
	end)
  it("meta", function()
    assert.truthy(is)
    assert.truthy(is.callable(tld))
  end)
  it("positive", function()
    assert.equal('com', tostring(tld('COM')))
    assert.equal('com', tostring(tld('CoM')))

    assert.equal('com', tostring(tld('com')))
    assert.equal('com', tostring(tld('.com')))

    assert.equal('рф', tostring(tld('.рф')))
    assert.equal('info', tostring(tld('.info')))

    assert.equal('com.ru', tostring(tld('com.ru')))
    assert.equal('com.ru', tostring(tld('.com.ru')))

    assert.is_true(tld('com') == tld('.com'))
  end)
  it("negative", function()
    assert.is_nil(tld('8.8.8.8'))

    assert.is_nil(tld(''))
    assert.is_nil(tld('.'))
    assert.is_nil(tld('.local'))
    assert.is_nil(tld('local'))
    assert.is_nil(tld({}))
    assert.is_nil(tld({'type'}))
    assert.is_nil(tld(0))
    assert.is_nil(tld(''))
    assert.is_nil(tld(false))
    assert.is_nil(tld(true))

    assert.not_true(tld('com') == tld('info'))
  end)
  it("nil", function()
    assert.is_nil(tld(nil))
    assert.is_nil(tld())
  end)
end)