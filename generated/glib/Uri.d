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


module glib.Uri;

private import glib.Bytes;
private import glib.ErrorG;
private import glib.GException;
private import glib.HashTable;
private import glib.Str;
private import glib.c.functions;
public  import glib.c.types;


/**
 * The #GUri type and related functions can be used to parse URIs into
 * their components, and build valid URIs from individual components.
 * 
 * Note that #GUri scope is to help manipulate URIs in various applications,
 * following [RFC 3986](https://tools.ietf.org/html/rfc3986). In particular,
 * it doesn't intend to cover web browser needs, and doesn't implement the
 * [WHATWG URL](https://url.spec.whatwg.org/) standard. No APIs are provided to
 * help prevent
 * [homograph attacks](https://en.wikipedia.org/wiki/IDN_homograph_attack), so
 * #GUri is not suitable for formatting URIs for display to the user for making
 * security-sensitive decisions.
 * 
 * ## Relative and absolute URIs # {#relative-absolute-uris}
 * 
 * As defined in [RFC 3986](https://tools.ietf.org/html/rfc3986#section-4), the
 * hierarchical nature of URIs means that they can either be ‘relative
 * references’ (sometimes referred to as ‘relative URIs’) or ‘URIs’ (for
 * clarity, ‘URIs’ are referred to in this documentation as
 * ‘absolute URIs’ — although
 * [in constrast to RFC 3986](https://tools.ietf.org/html/rfc3986#section-4.3),
 * fragment identifiers are always allowed).
 * 
 * Relative references have one or more components of the URI missing. In
 * particular, they have no scheme. Any other component, such as hostname,
 * query, etc. may be missing, apart from a path, which has to be specified (but
 * may be empty). The path may be relative, starting with `./` rather than `/`.
 * 
 * For example, a valid relative reference is `./path?query`,
 * `/?query#fragment` or `//example.com`.
 * 
 * Absolute URIs have a scheme specified. Any other components of the URI which
 * are missing are specified as explicitly unset in the URI, rather than being
 * resolved relative to a base URI using g_uri_parse_relative().
 * 
 * For example, a valid absolute URI is `file:///home/bob` or
 * `https://search.com?query=string`.
 * 
 * A #GUri instance is always an absolute URI. A string may be an absolute URI
 * or a relative reference; see the documentation for individual functions as to
 * what forms they accept.
 * 
 * ## Parsing URIs
 * 
 * The most minimalist APIs for parsing URIs are g_uri_split() and
 * g_uri_split_with_user(). These split a URI into its component
 * parts, and return the parts; the difference between the two is that
 * g_uri_split() treats the ‘userinfo’ component of the URI as a
 * single element, while g_uri_split_with_user() can (depending on the
 * #GUriFlags you pass) treat it as containing a username, password,
 * and authentication parameters. Alternatively, g_uri_split_network()
 * can be used when you are only interested in the components that are
 * needed to initiate a network connection to the service (scheme,
 * host, and port).
 * 
 * g_uri_parse() is similar to g_uri_split(), but instead of returning
 * individual strings, it returns a #GUri structure (and it requires
 * that the URI be an absolute URI).
 * 
 * g_uri_resolve_relative() and g_uri_parse_relative() allow you to
 * resolve a relative URI relative to a base URI.
 * g_uri_resolve_relative() takes two strings and returns a string,
 * and g_uri_parse_relative() takes a #GUri and a string and returns a
 * #GUri.
 * 
 * All of the parsing functions take a #GUriFlags argument describing
 * exactly how to parse the URI; see the documentation for that type
 * for more details on the specific flags that you can pass. If you
 * need to choose different flags based on the type of URI, you can
 * use g_uri_peek_scheme() on the URI string to check the scheme
 * first, and use that to decide what flags to parse it with.
 * 
 * For example, you might want to use %G_URI_PARAMS_WWW_FORM when parsing the
 * params for a web URI, so compare the result of g_uri_peek_scheme() against
 * `http` and `https`.
 * 
 * ## Building URIs
 * 
 * g_uri_join() and g_uri_join_with_user() can be used to construct
 * valid URI strings from a set of component strings. They are the
 * inverse of g_uri_split() and g_uri_split_with_user().
 * 
 * Similarly, g_uri_build() and g_uri_build_with_user() can be used to
 * construct a #GUri from a set of component strings.
 * 
 * As with the parsing functions, the building functions take a
 * #GUriFlags argument. In particular, it is important to keep in mind
 * whether the URI components you are using are already `%`-encoded. If so,
 * you must pass the %G_URI_FLAGS_ENCODED flag.
 * 
 * ## `file://` URIs
 * 
 * Note that Windows and Unix both define special rules for parsing
 * `file://` URIs (involving non-UTF-8 character sets on Unix, and the
 * interpretation of path separators on Windows). #GUri does not
 * implement these rules. Use g_filename_from_uri() and
 * g_filename_to_uri() if you want to properly convert between
 * `file://` URIs and local filenames.
 * 
 * ## URI Equality
 * 
 * Note that there is no `g_uri_equal ()` function, because comparing
 * URIs usefully requires scheme-specific knowledge that #GUri does
 * not have. #GUri can help with normalization if you use the various
 * encoded #GUriFlags as well as %G_URI_FLAGS_SCHEME_NORMALIZE however
 * it is not comprehensive.
 * For example, `data:,foo` and `data:;base64,Zm9v` resolve to the same
 * thing according to the `data:` URI specification which GLib does not
 * handle.
 *
 * Since: 2.66
 */
public class Uri
{
	/** the main Gtk struct */
	protected GUri* gUri;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GUri* getUriStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gUri;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gUri;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GUri* gUri, bool ownedRef = false)
	{
		this.gUri = gUri;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( ownedRef )
			g_uri_unref(gUri);
	}


	/**
	 * Gets @uri's authentication parameters, which may contain
	 * `%`-encoding, depending on the flags with which @uri was created.
	 * (If @uri was not created with %G_URI_FLAGS_HAS_AUTH_PARAMS then this will
	 * be %NULL.)
	 *
	 * Depending on the URI scheme, g_uri_parse_params() may be useful for
	 * further parsing this information.
	 *
	 * Returns: @uri's authentication parameters.
	 *
	 * Since: 2.66
	 */
	public string getAuthParams()
	{
		return Str.toString(g_uri_get_auth_params(gUri));
	}

	/**
	 * Gets @uri's flags set upon construction.
	 *
	 * Returns: @uri's flags.
	 *
	 * Since: 2.66
	 */
	public GUriFlags getFlags()
	{
		return g_uri_get_flags(gUri);
	}

	/**
	 * Gets @uri's fragment, which may contain `%`-encoding, depending on
	 * the flags with which @uri was created.
	 *
	 * Returns: @uri's fragment.
	 *
	 * Since: 2.66
	 */
	public string getFragment()
	{
		return Str.toString(g_uri_get_fragment(gUri));
	}

	/**
	 * Gets @uri's host. This will never have `%`-encoded characters,
	 * unless it is non-UTF-8 (which can only be the case if @uri was
	 * created with %G_URI_FLAGS_NON_DNS).
	 *
	 * If @uri contained an IPv6 address literal, this value will be just
	 * that address, without the brackets around it that are necessary in
	 * the string form of the URI. Note that in this case there may also
	 * be a scope ID attached to the address. Eg, `fe80::1234%``em1` (or
	 * `fe80::1234%``25em1` if the string is still encoded).
	 *
	 * Returns: @uri's host.
	 *
	 * Since: 2.66
	 */
	public string getHost()
	{
		return Str.toString(g_uri_get_host(gUri));
	}

	/**
	 * Gets @uri's password, which may contain `%`-encoding, depending on
	 * the flags with which @uri was created. (If @uri was not created
	 * with %G_URI_FLAGS_HAS_PASSWORD then this will be %NULL.)
	 *
	 * Returns: @uri's password.
	 *
	 * Since: 2.66
	 */
	public string getPassword()
	{
		return Str.toString(g_uri_get_password(gUri));
	}

	/**
	 * Gets @uri's path, which may contain `%`-encoding, depending on the
	 * flags with which @uri was created.
	 *
	 * Returns: @uri's path.
	 *
	 * Since: 2.66
	 */
	public string getPath()
	{
		return Str.toString(g_uri_get_path(gUri));
	}

	/**
	 * Gets @uri's port.
	 *
	 * Returns: @uri's port, or `-1` if no port was specified.
	 *
	 * Since: 2.66
	 */
	public int getPort()
	{
		return g_uri_get_port(gUri);
	}

	/**
	 * Gets @uri's query, which may contain `%`-encoding, depending on the
	 * flags with which @uri was created.
	 *
	 * For queries consisting of a series of `name=value` parameters,
	 * #GUriParamsIter or g_uri_parse_params() may be useful.
	 *
	 * Returns: @uri's query.
	 *
	 * Since: 2.66
	 */
	public string getQuery()
	{
		return Str.toString(g_uri_get_query(gUri));
	}

	/**
	 * Gets @uri's scheme. Note that this will always be all-lowercase,
	 * regardless of the string or strings that @uri was created from.
	 *
	 * Returns: @uri's scheme.
	 *
	 * Since: 2.66
	 */
	public string getScheme()
	{
		return Str.toString(g_uri_get_scheme(gUri));
	}

	/**
	 * Gets the ‘username’ component of @uri's userinfo, which may contain
	 * `%`-encoding, depending on the flags with which @uri was created.
	 * If @uri was not created with %G_URI_FLAGS_HAS_PASSWORD or
	 * %G_URI_FLAGS_HAS_AUTH_PARAMS, this is the same as g_uri_get_userinfo().
	 *
	 * Returns: @uri's user.
	 *
	 * Since: 2.66
	 */
	public string getUser()
	{
		return Str.toString(g_uri_get_user(gUri));
	}

	/**
	 * Gets @uri's userinfo, which may contain `%`-encoding, depending on
	 * the flags with which @uri was created.
	 *
	 * Returns: @uri's userinfo.
	 *
	 * Since: 2.66
	 */
	public string getUserinfo()
	{
		return Str.toString(g_uri_get_userinfo(gUri));
	}

	/**
	 * Parses @uri_ref according to @flags and, if it is a
	 * [relative URI][relative-absolute-uris], resolves it relative to @base_uri.
	 * If the result is not a valid absolute URI, it will be discarded, and an error
	 * returned.
	 *
	 * Params:
	 *     uriRef = a string representing a relative or absolute URI
	 *     flags = flags describing how to parse @uri_ref
	 *
	 * Returns: a new #GUri, or NULL on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public Uri parseRelative(string uriRef, GUriFlags flags)
	{
		GError* err = null;

		auto __p = g_uri_parse_relative(gUri, Str.toStringz(uriRef), flags, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p, true);
	}

	alias doref = ref_;
	/**
	 * Increments the reference count of @uri by one.
	 *
	 * Returns: @uri
	 *
	 * Since: 2.66
	 */
	public Uri ref_()
	{
		auto __p = g_uri_ref(gUri);

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p, true);
	}

	/**
	 * Returns a string representing @uri.
	 *
	 * This is not guaranteed to return a string which is identical to the
	 * string that @uri was parsed from. However, if the source URI was
	 * syntactically correct (according to RFC 3986), and it was parsed
	 * with %G_URI_FLAGS_ENCODED, then g_uri_to_string() is guaranteed to return
	 * a string which is at least semantically equivalent to the source
	 * URI (according to RFC 3986).
	 *
	 * If @uri might contain sensitive details, such as authentication parameters,
	 * or private data in its query string, and the returned string is going to be
	 * logged, then consider using g_uri_to_string_partial() to redact parts.
	 *
	 * Returns: a string representing @uri,
	 *     which the caller must free.
	 *
	 * Since: 2.66
	 */
	public override string toString()
	{
		auto retStr = g_uri_to_string(gUri);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Returns a string representing @uri, subject to the options in
	 * @flags. See g_uri_to_string() and #GUriHideFlags for more details.
	 *
	 * Params:
	 *     flags = flags describing what parts of @uri to hide
	 *
	 * Returns: a string representing
	 *     @uri, which the caller must free.
	 *
	 * Since: 2.66
	 */
	public string toStringPartial(GUriHideFlags flags)
	{
		auto retStr = g_uri_to_string_partial(gUri, flags);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Atomically decrements the reference count of @uri by one.
	 *
	 * When the reference count reaches zero, the resources allocated by
	 * @uri are freed
	 *
	 * Since: 2.66
	 */
	public void unref()
	{
		g_uri_unref(gUri);
	}

	/**
	 * Creates a new #GUri from the given components according to @flags.
	 *
	 * See also g_uri_build_with_user(), which allows specifying the
	 * components of the "userinfo" separately.
	 *
	 * Params:
	 *     flags = flags describing how to build the #GUri
	 *     scheme = the URI scheme
	 *     userinfo = the userinfo component, or %NULL
	 *     host = the host component, or %NULL
	 *     port = the port, or `-1`
	 *     path = the path component
	 *     query = the query component, or %NULL
	 *     fragment = the fragment, or %NULL
	 *
	 * Returns: a new #GUri
	 *
	 * Since: 2.66
	 */
	public static Uri build(GUriFlags flags, string scheme, string userinfo, string host, int port, string path, string query, string fragment)
	{
		auto __p = g_uri_build(flags, Str.toStringz(scheme), Str.toStringz(userinfo), Str.toStringz(host), port, Str.toStringz(path), Str.toStringz(query), Str.toStringz(fragment));

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p, true);
	}

	/**
	 * Creates a new #GUri from the given components according to @flags
	 * (%G_URI_FLAGS_HAS_PASSWORD is added unconditionally). The @flags must be
	 * coherent with the passed values, in particular use `%`-encoded values with
	 * %G_URI_FLAGS_ENCODED.
	 *
	 * In contrast to g_uri_build(), this allows specifying the components
	 * of the ‘userinfo’ field separately. Note that @user must be non-%NULL
	 * if either @password or @auth_params is non-%NULL.
	 *
	 * Params:
	 *     flags = flags describing how to build the #GUri
	 *     scheme = the URI scheme
	 *     user = the user component of the userinfo, or %NULL
	 *     password = the password component of the userinfo, or %NULL
	 *     authParams = the auth params of the userinfo, or %NULL
	 *     host = the host component, or %NULL
	 *     port = the port, or `-1`
	 *     path = the path component
	 *     query = the query component, or %NULL
	 *     fragment = the fragment, or %NULL
	 *
	 * Returns: a new #GUri
	 *
	 * Since: 2.66
	 */
	public static Uri buildWithUser(GUriFlags flags, string scheme, string user, string password, string authParams, string host, int port, string path, string query, string fragment)
	{
		auto __p = g_uri_build_with_user(flags, Str.toStringz(scheme), Str.toStringz(user), Str.toStringz(password), Str.toStringz(authParams), Str.toStringz(host), port, Str.toStringz(path), Str.toStringz(query), Str.toStringz(fragment));

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p, true);
	}

	/** */
	public static GQuark errorQuark()
	{
		return g_uri_error_quark();
	}

	/**
	 * Escapes arbitrary data for use in a URI.
	 *
	 * Normally all characters that are not ‘unreserved’ (i.e. ASCII
	 * alphanumerical characters plus dash, dot, underscore and tilde) are
	 * escaped. But if you specify characters in @reserved_chars_allowed
	 * they are not escaped. This is useful for the ‘reserved’ characters
	 * in the URI specification, since those are allowed unescaped in some
	 * portions of a URI.
	 *
	 * Though technically incorrect, this will also allow escaping nul
	 * bytes as `%``00`.
	 *
	 * Params:
	 *     unescaped = the unescaped input data.
	 *     reservedCharsAllowed = a string of reserved
	 *         characters that are allowed to be used, or %NULL.
	 *
	 * Returns: an escaped version of @unescaped.
	 *     The returned string should be freed when no longer needed.
	 *
	 * Since: 2.66
	 */
	public static string escapeBytes(ubyte[] unescaped, string reservedCharsAllowed)
	{
		auto retStr = g_uri_escape_bytes(unescaped.ptr, cast(size_t)unescaped.length, Str.toStringz(reservedCharsAllowed));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Escapes a string for use in a URI.
	 *
	 * Normally all characters that are not "unreserved" (i.e. ASCII
	 * alphanumerical characters plus dash, dot, underscore and tilde) are
	 * escaped. But if you specify characters in @reserved_chars_allowed
	 * they are not escaped. This is useful for the "reserved" characters
	 * in the URI specification, since those are allowed unescaped in some
	 * portions of a URI.
	 *
	 * Params:
	 *     unescaped = the unescaped input string.
	 *     reservedCharsAllowed = a string of reserved
	 *         characters that are allowed to be used, or %NULL.
	 *     allowUtf8 = %TRUE if the result can include UTF-8 characters.
	 *
	 * Returns: an escaped version of @unescaped. The
	 *     returned string should be freed when no longer needed.
	 *
	 * Since: 2.16
	 */
	public static string escapeString(string unescaped, string reservedCharsAllowed, bool allowUtf8)
	{
		auto retStr = g_uri_escape_string(Str.toStringz(unescaped), Str.toStringz(reservedCharsAllowed), allowUtf8);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Parses @uri_string according to @flags, to determine whether it is a valid
	 * [absolute URI][relative-absolute-uris], i.e. it does not need to be resolved
	 * relative to another URI using g_uri_parse_relative().
	 *
	 * If it’s not a valid URI, an error is returned explaining how it’s invalid.
	 *
	 * See g_uri_split(), and the definition of #GUriFlags, for more
	 * information on the effect of @flags.
	 *
	 * Params:
	 *     uriString = a string containing an absolute URI
	 *     flags = flags for parsing @uri_string
	 *
	 * Returns: %TRUE if @uri_string is a valid absolute URI, %FALSE on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static bool isValid(string uriString, GUriFlags flags)
	{
		GError* err = null;

		auto __p = g_uri_is_valid(Str.toStringz(uriString), flags, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Joins the given components together according to @flags to create
	 * an absolute URI string. @path may not be %NULL (though it may be the empty
	 * string).
	 *
	 * When @host is present, @path must either be empty or begin with a slash (`/`)
	 * character. When @host is not present, @path cannot begin with two slash
	 * characters (`//`). See
	 * [RFC 3986, section 3](https://tools.ietf.org/html/rfc3986#section-3).
	 *
	 * See also g_uri_join_with_user(), which allows specifying the
	 * components of the ‘userinfo’ separately.
	 *
	 * %G_URI_FLAGS_HAS_PASSWORD and %G_URI_FLAGS_HAS_AUTH_PARAMS are ignored if set
	 * in @flags.
	 *
	 * Params:
	 *     flags = flags describing how to build the URI string
	 *     scheme = the URI scheme, or %NULL
	 *     userinfo = the userinfo component, or %NULL
	 *     host = the host component, or %NULL
	 *     port = the port, or `-1`
	 *     path = the path component
	 *     query = the query component, or %NULL
	 *     fragment = the fragment, or %NULL
	 *
	 * Returns: an absolute URI string
	 *
	 * Since: 2.66
	 */
	public static string join(GUriFlags flags, string scheme, string userinfo, string host, int port, string path, string query, string fragment)
	{
		auto retStr = g_uri_join(flags, Str.toStringz(scheme), Str.toStringz(userinfo), Str.toStringz(host), port, Str.toStringz(path), Str.toStringz(query), Str.toStringz(fragment));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Joins the given components together according to @flags to create
	 * an absolute URI string. @path may not be %NULL (though it may be the empty
	 * string).
	 *
	 * In contrast to g_uri_join(), this allows specifying the components
	 * of the ‘userinfo’ separately. It otherwise behaves the same.
	 *
	 * %G_URI_FLAGS_HAS_PASSWORD and %G_URI_FLAGS_HAS_AUTH_PARAMS are ignored if set
	 * in @flags.
	 *
	 * Params:
	 *     flags = flags describing how to build the URI string
	 *     scheme = the URI scheme, or %NULL
	 *     user = the user component of the userinfo, or %NULL
	 *     password = the password component of the userinfo, or
	 *         %NULL
	 *     authParams = the auth params of the userinfo, or
	 *         %NULL
	 *     host = the host component, or %NULL
	 *     port = the port, or `-1`
	 *     path = the path component
	 *     query = the query component, or %NULL
	 *     fragment = the fragment, or %NULL
	 *
	 * Returns: an absolute URI string
	 *
	 * Since: 2.66
	 */
	public static string joinWithUser(GUriFlags flags, string scheme, string user, string password, string authParams, string host, int port, string path, string query, string fragment)
	{
		auto retStr = g_uri_join_with_user(flags, Str.toStringz(scheme), Str.toStringz(user), Str.toStringz(password), Str.toStringz(authParams), Str.toStringz(host), port, Str.toStringz(path), Str.toStringz(query), Str.toStringz(fragment));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Splits an URI list conforming to the text/uri-list
	 * mime type defined in RFC 2483 into individual URIs,
	 * discarding any comments. The URIs are not validated.
	 *
	 * Params:
	 *     uriList = an URI list
	 *
	 * Returns: a newly allocated %NULL-terminated list
	 *     of strings holding the individual URIs. The array should be freed
	 *     with g_strfreev().
	 *
	 * Since: 2.6
	 */
	public static string[] listExtractUris(string uriList)
	{
		auto retStr = g_uri_list_extract_uris(Str.toStringz(uriList));

		scope(exit) Str.freeStringArray(retStr);
		return Str.toStringArray(retStr);
	}

	/**
	 * Parses @uri_string according to @flags. If the result is not a
	 * valid [absolute URI][relative-absolute-uris], it will be discarded, and an
	 * error returned.
	 *
	 * Params:
	 *     uriString = a string representing an absolute URI
	 *     flags = flags describing how to parse @uri_string
	 *
	 * Returns: a new #GUri, or NULL on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static Uri parse(string uriString, GUriFlags flags)
	{
		GError* err = null;

		auto __p = g_uri_parse(Str.toStringz(uriString), flags, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p, true);
	}

	/**
	 * Many URI schemes include one or more attribute/value pairs as part of the URI
	 * value. This method can be used to parse them into a hash table. When an
	 * attribute has multiple occurrences, the last value is the final returned
	 * value. If you need to handle repeated attributes differently, use
	 * #GUriParamsIter.
	 *
	 * The @params string is assumed to still be `%`-encoded, but the returned
	 * values will be fully decoded. (Thus it is possible that the returned values
	 * may contain `=` or @separators, if the value was encoded in the input.)
	 * Invalid `%`-encoding is treated as with the %G_URI_FLAGS_PARSE_RELAXED
	 * rules for g_uri_parse(). (However, if @params is the path or query string
	 * from a #GUri that was parsed without %G_URI_FLAGS_PARSE_RELAXED and
	 * %G_URI_FLAGS_ENCODED, then you already know that it does not contain any
	 * invalid encoding.)
	 *
	 * %G_URI_PARAMS_WWW_FORM is handled as documented for g_uri_params_iter_init().
	 *
	 * If %G_URI_PARAMS_CASE_INSENSITIVE is passed to @flags, attributes will be
	 * compared case-insensitively, so a params string `attr=123&Attr=456` will only
	 * return a single attribute–value pair, `Attr=456`. Case will be preserved in
	 * the returned attributes.
	 *
	 * If @params cannot be parsed (for example, it contains two @separators
	 * characters in a row), then @error is set and %NULL is returned.
	 *
	 * Params:
	 *     params = a `%`-encoded string containing `attribute=value`
	 *         parameters
	 *     length = the length of @params, or `-1` if it is nul-terminated
	 *     separators = the separator byte character set between parameters. (usually
	 *         `&`, but sometimes `;` or both `&;`). Note that this function works on
	 *         bytes not characters, so it can't be used to delimit UTF-8 strings for
	 *         anything but ASCII characters. You may pass an empty set, in which case
	 *         no splitting will occur.
	 *     flags = flags to modify the way the parameters are handled.
	 *
	 * Returns: A hash table of attribute/value pairs, with both names and values
	 *     fully-decoded; or %NULL on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static HashTable parseParams(string params, ptrdiff_t length, string separators, GUriParamsFlags flags)
	{
		GError* err = null;

		auto __p = g_uri_parse_params(Str.toStringz(params), length, Str.toStringz(separators), flags, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return new HashTable(cast(GHashTable*) __p, true);
	}

	/**
	 * Gets the scheme portion of a URI string.
	 * [RFC 3986](https://tools.ietf.org/html/rfc3986#section-3) decodes the scheme
	 * as:
	 * |[
	 * URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
	 * ]|
	 * Common schemes include `file`, `https`, `svn+ssh`, etc.
	 *
	 * Params:
	 *     uri = a valid URI.
	 *
	 * Returns: The ‘scheme’ component of the URI, or
	 *     %NULL on error. The returned string should be freed when no longer needed.
	 *
	 * Since: 2.16
	 */
	public static string parseScheme(string uri)
	{
		auto retStr = g_uri_parse_scheme(Str.toStringz(uri));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the scheme portion of a URI string.
	 * [RFC 3986](https://tools.ietf.org/html/rfc3986#section-3) decodes the scheme
	 * as:
	 * |[
	 * URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
	 * ]|
	 * Common schemes include `file`, `https`, `svn+ssh`, etc.
	 *
	 * Unlike g_uri_parse_scheme(), the returned scheme is normalized to
	 * all-lowercase and does not need to be freed.
	 *
	 * Params:
	 *     uri = a valid URI.
	 *
	 * Returns: The ‘scheme’ component of the URI, or
	 *     %NULL on error. The returned string is normalized to all-lowercase, and
	 *     interned via g_intern_string(), so it does not need to be freed.
	 *
	 * Since: 2.66
	 */
	public static string peekScheme(string uri)
	{
		return Str.toString(g_uri_peek_scheme(Str.toStringz(uri)));
	}

	/**
	 * Parses @uri_ref according to @flags and, if it is a
	 * [relative URI][relative-absolute-uris], resolves it relative to
	 * @base_uri_string. If the result is not a valid absolute URI, it will be
	 * discarded, and an error returned.
	 *
	 * (If @base_uri_string is %NULL, this just returns @uri_ref, or
	 * %NULL if @uri_ref is invalid or not absolute.)
	 *
	 * Params:
	 *     baseUriString = a string representing a base URI
	 *     uriRef = a string representing a relative or absolute URI
	 *     flags = flags describing how to parse @uri_ref
	 *
	 * Returns: the resolved URI string,
	 *     or NULL on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static string resolveRelative(string baseUriString, string uriRef, GUriFlags flags)
	{
		GError* err = null;

		auto retStr = g_uri_resolve_relative(Str.toStringz(baseUriString), Str.toStringz(uriRef), flags, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Parses @uri_ref (which can be an
	 * [absolute or relative URI][relative-absolute-uris]) according to @flags, and
	 * returns the pieces. Any component that doesn't appear in @uri_ref will be
	 * returned as %NULL (but note that all URIs always have a path component,
	 * though it may be the empty string).
	 *
	 * If @flags contains %G_URI_FLAGS_ENCODED, then `%`-encoded characters in
	 * @uri_ref will remain encoded in the output strings. (If not,
	 * then all such characters will be decoded.) Note that decoding will
	 * only work if the URI components are ASCII or UTF-8, so you will
	 * need to use %G_URI_FLAGS_ENCODED if they are not.
	 *
	 * Note that the %G_URI_FLAGS_HAS_PASSWORD and
	 * %G_URI_FLAGS_HAS_AUTH_PARAMS @flags are ignored by g_uri_split(),
	 * since it always returns only the full userinfo; use
	 * g_uri_split_with_user() if you want it split up.
	 *
	 * Params:
	 *     uriRef = a string containing a relative or absolute URI
	 *     flags = flags for parsing @uri_ref
	 *     scheme = on return, contains
	 *         the scheme (converted to lowercase), or %NULL
	 *     userinfo = on return, contains
	 *         the userinfo, or %NULL
	 *     host = on return, contains the
	 *         host, or %NULL
	 *     port = on return, contains the
	 *         port, or `-1`
	 *     path = on return, contains the
	 *         path
	 *     query = on return, contains the
	 *         query, or %NULL
	 *     fragment = on return, contains
	 *         the fragment, or %NULL
	 *
	 * Returns: %TRUE if @uri_ref parsed successfully, %FALSE
	 *     on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static bool split(string uriRef, GUriFlags flags, out string scheme, out string userinfo, out string host, out int port, out string path, out string query, out string fragment)
	{
		char* outscheme = null;
		char* outuserinfo = null;
		char* outhost = null;
		char* outpath = null;
		char* outquery = null;
		char* outfragment = null;
		GError* err = null;

		auto __p = g_uri_split(Str.toStringz(uriRef), flags, &outscheme, &outuserinfo, &outhost, &port, &outpath, &outquery, &outfragment, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scheme = Str.toString(outscheme);
		userinfo = Str.toString(outuserinfo);
		host = Str.toString(outhost);
		path = Str.toString(outpath);
		query = Str.toString(outquery);
		fragment = Str.toString(outfragment);

		return __p;
	}

	/**
	 * Parses @uri_string (which must be an [absolute URI][relative-absolute-uris])
	 * according to @flags, and returns the pieces relevant to connecting to a host.
	 * See the documentation for g_uri_split() for more details; this is
	 * mostly a wrapper around that function with simpler arguments.
	 * However, it will return an error if @uri_string is a relative URI,
	 * or does not contain a hostname component.
	 *
	 * Params:
	 *     uriString = a string containing an absolute URI
	 *     flags = flags for parsing @uri_string
	 *     scheme = on return, contains
	 *         the scheme (converted to lowercase), or %NULL
	 *     host = on return, contains the
	 *         host, or %NULL
	 *     port = on return, contains the
	 *         port, or `-1`
	 *
	 * Returns: %TRUE if @uri_string parsed successfully,
	 *     %FALSE on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static bool splitNetwork(string uriString, GUriFlags flags, out string scheme, out string host, out int port)
	{
		char* outscheme = null;
		char* outhost = null;
		GError* err = null;

		auto __p = g_uri_split_network(Str.toStringz(uriString), flags, &outscheme, &outhost, &port, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scheme = Str.toString(outscheme);
		host = Str.toString(outhost);

		return __p;
	}

	/**
	 * Parses @uri_ref (which can be an
	 * [absolute or relative URI][relative-absolute-uris]) according to @flags, and
	 * returns the pieces. Any component that doesn't appear in @uri_ref will be
	 * returned as %NULL (but note that all URIs always have a path component,
	 * though it may be the empty string).
	 *
	 * See g_uri_split(), and the definition of #GUriFlags, for more
	 * information on the effect of @flags. Note that @password will only
	 * be parsed out if @flags contains %G_URI_FLAGS_HAS_PASSWORD, and
	 * @auth_params will only be parsed out if @flags contains
	 * %G_URI_FLAGS_HAS_AUTH_PARAMS.
	 *
	 * Params:
	 *     uriRef = a string containing a relative or absolute URI
	 *     flags = flags for parsing @uri_ref
	 *     scheme = on return, contains
	 *         the scheme (converted to lowercase), or %NULL
	 *     user = on return, contains
	 *         the user, or %NULL
	 *     password = on return, contains
	 *         the password, or %NULL
	 *     authParams = on return, contains
	 *         the auth_params, or %NULL
	 *     host = on return, contains the
	 *         host, or %NULL
	 *     port = on return, contains the
	 *         port, or `-1`
	 *     path = on return, contains the
	 *         path
	 *     query = on return, contains the
	 *         query, or %NULL
	 *     fragment = on return, contains
	 *         the fragment, or %NULL
	 *
	 * Returns: %TRUE if @uri_ref parsed successfully, %FALSE
	 *     on error.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static bool splitWithUser(string uriRef, GUriFlags flags, out string scheme, out string user, out string password, out string authParams, out string host, out int port, out string path, out string query, out string fragment)
	{
		char* outscheme = null;
		char* outuser = null;
		char* outpassword = null;
		char* outauthParams = null;
		char* outhost = null;
		char* outpath = null;
		char* outquery = null;
		char* outfragment = null;
		GError* err = null;

		auto __p = g_uri_split_with_user(Str.toStringz(uriRef), flags, &outscheme, &outuser, &outpassword, &outauthParams, &outhost, &port, &outpath, &outquery, &outfragment, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		scheme = Str.toString(outscheme);
		user = Str.toString(outuser);
		password = Str.toString(outpassword);
		authParams = Str.toString(outauthParams);
		host = Str.toString(outhost);
		path = Str.toString(outpath);
		query = Str.toString(outquery);
		fragment = Str.toString(outfragment);

		return __p;
	}

	/**
	 * Unescapes a segment of an escaped string as binary data.
	 *
	 * Note that in contrast to g_uri_unescape_string(), this does allow
	 * nul bytes to appear in the output.
	 *
	 * If any of the characters in @illegal_characters appears as an escaped
	 * character in @escaped_string, then that is an error and %NULL will be
	 * returned. This is useful if you want to avoid for instance having a slash
	 * being expanded in an escaped path element, which might confuse pathname
	 * handling.
	 *
	 * Params:
	 *     escapedString = A URI-escaped string
	 *     length = the length (in bytes) of @escaped_string to escape, or `-1` if it
	 *         is nul-terminated.
	 *     illegalCharacters = a string of illegal characters
	 *         not to be allowed, or %NULL.
	 *
	 * Returns: an unescaped version of @escaped_string
	 *     or %NULL on error (if decoding failed, using %G_URI_ERROR_FAILED error
	 *     code). The returned #GBytes should be unreffed when no longer needed.
	 *
	 * Since: 2.66
	 *
	 * Throws: GException on failure.
	 */
	public static Bytes unescapeBytes(string escapedString, ptrdiff_t length, string illegalCharacters)
	{
		GError* err = null;

		auto __p = g_uri_unescape_bytes(Str.toStringz(escapedString), length, Str.toStringz(illegalCharacters), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) __p, true);
	}

	/**
	 * Unescapes a segment of an escaped string.
	 *
	 * If any of the characters in @illegal_characters or the NUL
	 * character appears as an escaped character in @escaped_string, then
	 * that is an error and %NULL will be returned. This is useful if you
	 * want to avoid for instance having a slash being expanded in an
	 * escaped path element, which might confuse pathname handling.
	 *
	 * Note: `NUL` byte is not accepted in the output, in contrast to
	 * g_uri_unescape_bytes().
	 *
	 * Params:
	 *     escapedString = A string, may be %NULL
	 *     escapedStringEnd = Pointer to end of @escaped_string,
	 *         may be %NULL
	 *     illegalCharacters = An optional string of illegal
	 *         characters not to be allowed, may be %NULL
	 *
	 * Returns: an unescaped version of @escaped_string,
	 *     or %NULL on error. The returned string should be freed when no longer
	 *     needed.  As a special case if %NULL is given for @escaped_string, this
	 *     function will return %NULL.
	 *
	 * Since: 2.16
	 */
	public static string unescapeSegment(string escapedString, string escapedStringEnd, string illegalCharacters)
	{
		auto retStr = g_uri_unescape_segment(Str.toStringz(escapedString), Str.toStringz(escapedStringEnd), Str.toStringz(illegalCharacters));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Unescapes a whole escaped string.
	 *
	 * If any of the characters in @illegal_characters or the NUL
	 * character appears as an escaped character in @escaped_string, then
	 * that is an error and %NULL will be returned. This is useful if you
	 * want to avoid for instance having a slash being expanded in an
	 * escaped path element, which might confuse pathname handling.
	 *
	 * Params:
	 *     escapedString = an escaped string to be unescaped.
	 *     illegalCharacters = a string of illegal characters
	 *         not to be allowed, or %NULL.
	 *
	 * Returns: an unescaped version of @escaped_string.
	 *     The returned string should be freed when no longer needed.
	 *
	 * Since: 2.16
	 */
	public static string unescapeString(string escapedString, string illegalCharacters)
	{
		auto retStr = g_uri_unescape_string(Str.toStringz(escapedString), Str.toStringz(illegalCharacters));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
