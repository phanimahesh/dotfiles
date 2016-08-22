Set Firefox with private tab as the default browser
===================================================

I click links from IRC, and I don't trust them. Private mode
is a small protection that prevents trackers from assosciating
the link with me trivially. Also, I don't want everything I click
without knowing what it has, to be in my history.

stow `applications` to get firefox-private.desktop, and do

    xdg-settings set default-web-browser firefox-private.desktop

Tada! All links from other apps will now open in private tabs by default.
