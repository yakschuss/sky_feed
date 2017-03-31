defmodule SkyFeed.Feed.Publish do

  def feed(channel, items) do
    """
    <?xml version="1.0" encoding="utf-8"?>
    <rss version="2.0">
      <channel>
        #{channel}#{Enum.join items, ""}
      </channel>
    </rss>
    """
  end

  def item(title, desc, link, guid) do
    """
    <item>
      <title>#{title}</title>
      <description><![CDATA[#{desc}]]></description>
      <link>#{link}</link>
      <guid>#{guid}</guid>
    </item>
    """
  end

  def channel(title, link, desc, lang) do
    """
      <title>#{title}</title>
      <link>#{link}</link>
      <description>#{desc}</description>
      <language>#{lang}</language>
    """
  end
end

