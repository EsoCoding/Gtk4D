/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module soup.Cookie;

private import glib.ConstructionException;
private import glib.DateTime;
private import glib.Str;
private import glib.Uri;
private import glib.c.functions;
private import gobject.ObjectG;
private import soup.c.functions;
public  import soup.c.types;


/**
 * Implements HTTP cookies, as described by
 * [RFC 6265](http://tools.ietf.org/html/rfc6265.txt).
 * 
 * To have a [class@Session] handle cookies for your appliction
 * automatically, use a [class@CookieJar].
 * 
 * @name and @value will be set for all cookies. If the cookie is
 * generated from a string that appears to have no name, then @name
 * will be the empty string.
 * 
 * @domain and @path give the host or domain, and path within that
 * host/domain, to restrict this cookie to. If @domain starts with
 * ".", that indicates a domain (which matches the string after the
 * ".", or any hostname that has @domain as a suffix). Otherwise, it
 * is a hostname and must match exactly.
 * 
 * @expires will be non-%NULL if the cookie uses either the original
 * "expires" attribute, or the newer "max-age" attribute. If @expires
 * is %NULL, it indicates that neither "expires" nor "max-age" was
 * specified, and the cookie expires at the end of the session.
 * 
 * If @http_only is set, the cookie should not be exposed to untrusted
 * code (eg, javascript), so as to minimize the danger posed by
 * cross-site scripting attacks.
 */
public class Cookie
{
	/** the main Gtk struct */
	protected SoupCookie* soupCookie;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public SoupCookie* getCookieStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupCookie;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)soupCookie;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupCookie* soupCookie, bool ownedRef = false)
	{
		this.soupCookie = soupCookie;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( ownedRef )
			soup_cookie_free(soupCookie);
	}


	/** */
	public static GType getType()
	{
		return soup_cookie_get_type();
	}

	/**
	 * Creates a new #SoupCookie with the given attributes.
	 *
	 * Use [method@Cookie.set_secure] and [method@Cookie.set_http_only] if you
	 * need to set those attributes on the returned cookie.
	 *
	 * If @domain starts with ".", that indicates a domain (which matches
	 * the string after the ".", or any hostname that has @domain as a
	 * suffix). Otherwise, it is a hostname and must match exactly.
	 *
	 * @max_age is used to set the "expires" attribute on the cookie; pass
	 * -1 to not include the attribute (indicating that the cookie expires
	 * with the current session), 0 for an already-expired cookie, or a
	 * lifetime in seconds. You can use the constants
	 * %SOUP_COOKIE_MAX_AGE_ONE_HOUR, %SOUP_COOKIE_MAX_AGE_ONE_DAY,
	 * %SOUP_COOKIE_MAX_AGE_ONE_WEEK and %SOUP_COOKIE_MAX_AGE_ONE_YEAR (or
	 * multiples thereof) to calculate this value. (If you really care
	 * about setting the exact time that the cookie will expire, use
	 * [method@Cookie.set_expires].)
	 *
	 * Params:
	 *     name = cookie name
	 *     value = cookie value
	 *     domain = cookie domain or hostname
	 *     path = cookie path, or %NULL
	 *     maxAge = max age of the cookie, or -1 for a session cookie
	 *
	 * Returns: a new #SoupCookie.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, string value, string domain, string path, int maxAge)
	{
		auto __p = soup_cookie_new(Str.toStringz(name), Str.toStringz(value), Str.toStringz(domain), Str.toStringz(path), maxAge);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupCookie*) __p);
	}

	/**
	 * Tests if @cookie should be sent to @uri.
	 *
	 * (At the moment, this does not check that @cookie's domain matches
	 * @uri, because it assumes that the caller has already done that.
	 * But don't rely on that; it may change in the future.)
	 *
	 * Params:
	 *     uri = a #GUri
	 *
	 * Returns: %TRUE if @cookie should be sent to @uri, %FALSE if not
	 */
	public bool appliesToUri(Uri uri)
	{
		return soup_cookie_applies_to_uri(soupCookie, (uri is null) ? null : uri.getUriStruct()) != 0;
	}

	/**
	 * Copies @cookie.
	 *
	 * Returns: a copy of @cookie
	 */
	public Cookie copy()
	{
		auto __p = soup_cookie_copy(soupCookie);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Cookie)(cast(SoupCookie*) __p, true);
	}

	/**
	 * Checks if the @cookie's domain and @host match.
	 *
	 * The domains match if @cookie should be sent when making a request to @host,
	 * or that @cookie should be accepted when receiving a response from @host.
	 *
	 * Params:
	 *     host = a URI
	 *
	 * Returns: %TRUE if the domains match, %FALSE otherwise
	 */
	public bool domainMatches(string host)
	{
		return soup_cookie_domain_matches(soupCookie, Str.toStringz(host)) != 0;
	}

	/**
	 * Tests if @cookie1 and @cookie2 are equal.
	 *
	 * Note that currently, this does not check that the cookie domains
	 * match. This may change in the future.
	 *
	 * Params:
	 *     cookie2 = a #SoupCookie
	 *
	 * Returns: whether the cookies are equal.
	 */
	public bool equal(Cookie cookie2)
	{
		return soup_cookie_equal(soupCookie, (cookie2 is null) ? null : cookie2.getCookieStruct()) != 0;
	}

	/**
	 * Frees @cookie.
	 */
	public void free()
	{
		soup_cookie_free(soupCookie);
		ownedRef = false;
	}

	/**
	 * Gets @cookie's domain.
	 *
	 * Returns: @cookie's domain
	 */
	public string getDomain()
	{
		return Str.toString(soup_cookie_get_domain(soupCookie));
	}

	/**
	 * Gets @cookie's expiration time.
	 *
	 * Returns: @cookie's expiration time, which is
	 *     owned by @cookie and should not be modified or freed.
	 */
	public DateTime getExpires()
	{
		auto __p = soup_cookie_get_expires(soupCookie);

		if(__p is null)
		{
			return null;
		}

		return new DateTime(cast(GDateTime*) __p);
	}

	/**
	 * Gets @cookie's HttpOnly attribute.
	 *
	 * Returns: @cookie's HttpOnly attribute
	 */
	public bool getHttpOnly()
	{
		return soup_cookie_get_http_only(soupCookie) != 0;
	}

	/**
	 * Gets @cookie's name.
	 *
	 * Returns: @cookie's name
	 */
	public string getName()
	{
		return Str.toString(soup_cookie_get_name(soupCookie));
	}

	/**
	 * Gets @cookie's path.
	 *
	 * Returns: @cookie's path
	 */
	public string getPath()
	{
		return Str.toString(soup_cookie_get_path(soupCookie));
	}

	/**
	 * Returns the same-site policy for this cookie.
	 *
	 * Returns: a #SoupSameSitePolicy
	 */
	public SoupSameSitePolicy getSameSitePolicy()
	{
		return soup_cookie_get_same_site_policy(soupCookie);
	}

	/**
	 * Gets @cookie's secure attribute.
	 *
	 * Returns: @cookie's secure attribute
	 */
	public bool getSecure()
	{
		return soup_cookie_get_secure(soupCookie) != 0;
	}

	/**
	 * Gets @cookie's value.
	 *
	 * Returns: @cookie's value
	 */
	public string getValue()
	{
		return Str.toString(soup_cookie_get_value(soupCookie));
	}

	/**
	 * Sets @cookie's domain to @domain.
	 *
	 * Params:
	 *     domain = the new domain
	 */
	public void setDomain(string domain)
	{
		soup_cookie_set_domain(soupCookie, Str.toStringz(domain));
	}

	/**
	 * Sets @cookie's expiration time to @expires.
	 *
	 * If @expires is %NULL, @cookie will be a session cookie and will expire at the
	 * end of the client's session.
	 *
	 * (This sets the same property as [method@Cookie.set_max_age].)
	 *
	 * Params:
	 *     expires = the new expiration time, or %NULL
	 */
	public void setExpires(DateTime expires)
	{
		soup_cookie_set_expires(soupCookie, (expires is null) ? null : expires.getDateTimeStruct());
	}

	/**
	 * Sets @cookie's HttpOnly attribute to @http_only.
	 *
	 * If %TRUE, @cookie will be marked as "http only", meaning it should not be
	 * exposed to web page scripts or other untrusted code.
	 *
	 * Params:
	 *     httpOnly = the new value for the HttpOnly attribute
	 */
	public void setHttpOnly(bool httpOnly)
	{
		soup_cookie_set_http_only(soupCookie, httpOnly);
	}

	/**
	 * Sets @cookie's max age to @max_age.
	 *
	 * If @max_age is -1, the cookie is a session cookie, and will expire at the end
	 * of the client's session. Otherwise, it is the number of seconds until the
	 * cookie expires. You can use the constants %SOUP_COOKIE_MAX_AGE_ONE_HOUR,
	 * %SOUP_COOKIE_MAX_AGE_ONE_DAY, %SOUP_COOKIE_MAX_AGE_ONE_WEEK and
	 * %SOUP_COOKIE_MAX_AGE_ONE_YEAR (or multiples thereof) to calculate this value.
	 * (A value of 0 indicates that the cookie should be considered
	 * already-expired.)
	 *
	 * This sets the same property as [method@Cookie.set_expires].
	 *
	 * Params:
	 *     maxAge = the new max age
	 */
	public void setMaxAge(int maxAge)
	{
		soup_cookie_set_max_age(soupCookie, maxAge);
	}

	/**
	 * Sets @cookie's name to @name.
	 *
	 * Params:
	 *     name = the new name
	 */
	public void setName(string name)
	{
		soup_cookie_set_name(soupCookie, Str.toStringz(name));
	}

	/**
	 * Sets @cookie's path to @path.
	 *
	 * Params:
	 *     path = the new path
	 */
	public void setPath(string path)
	{
		soup_cookie_set_path(soupCookie, Str.toStringz(path));
	}

	/**
	 * When used in conjunction with
	 * [method@CookieJar.get_cookie_list_with_same_site_info] this sets the policy
	 * of when this cookie should be exposed.
	 *
	 * Params:
	 *     policy = a #SoupSameSitePolicy
	 */
	public void setSameSitePolicy(SoupSameSitePolicy policy)
	{
		soup_cookie_set_same_site_policy(soupCookie, policy);
	}

	/**
	 * Sets @cookie's secure attribute to @secure.
	 *
	 * If %TRUE, @cookie will only be transmitted from the client to the server over
	 * secure (https) connections.
	 *
	 * Params:
	 *     secure = the new value for the secure attribute
	 */
	public void setSecure(bool secure)
	{
		soup_cookie_set_secure(soupCookie, secure);
	}

	/**
	 * Sets @cookie's value to @value.
	 *
	 * Params:
	 *     value = the new value
	 */
	public void setValue(string value)
	{
		soup_cookie_set_value(soupCookie, Str.toStringz(value));
	}

	/**
	 * Serializes @cookie in the format used by the Cookie header (ie, for
	 * returning a cookie from a [class@Session] to a server).
	 *
	 * Returns: the header
	 */
	public string toCookieHeader()
	{
		auto retStr = soup_cookie_to_cookie_header(soupCookie);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Serializes @cookie in the format used by the Set-Cookie header.
	 *
	 * i.e. for sending a cookie from a [class@Server] to a client.
	 *
	 * Returns: the header
	 */
	public string toSetCookieHeader()
	{
		auto retStr = soup_cookie_to_set_cookie_header(soupCookie);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Parses @header and returns a #SoupCookie.
	 *
	 * If @header contains multiple cookies, only the first one will be parsed.
	 *
	 * If @header does not have "path" or "domain" attributes, they will
	 * be defaulted from @origin. If @origin is %NULL, path will default
	 * to "/", but domain will be left as %NULL. Note that this is not a
	 * valid state for a #SoupCookie, and you will need to fill in some
	 * appropriate string for the domain if you want to actually make use
	 * of the cookie.
	 *
	 * Params:
	 *     header = a cookie string (eg, the value of a Set-Cookie header)
	 *     origin = origin of the cookie
	 *
	 * Returns: a new #SoupCookie, or %NULL if it could
	 *     not be parsed, or contained an illegal "domain" attribute for a
	 *     cookie originating from @origin.
	 */
	public static Cookie parse(string header, Uri origin)
	{
		auto __p = soup_cookie_parse(Str.toStringz(header), (origin is null) ? null : origin.getUriStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Cookie)(cast(SoupCookie*) __p, true);
	}
}
