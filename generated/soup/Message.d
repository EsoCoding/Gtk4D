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


module soup.Message;

private import gio.IOStream;
private import gio.InputStream;
private import gio.SocketAddress;
private import gio.TlsCertificate;
private import gio.TlsClientConnectionIF;
private import gio.TlsPassword;
private import glib.Bytes;
private import glib.ConstructionException;
private import glib.HashTable;
private import glib.Str;
private import glib.Uri;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import soup.Auth;
private import soup.MessageHeaders;
private import soup.MessageMetrics;
private import soup.Multipart;
private import soup.c.functions;
public  import soup.c.types;
private import std.algorithm;


/**
 * Represents an HTTP message being sent or received.
 * 
 * A #SoupMessage represents an HTTP message that is being sent or
 * received.
 * 
 * You would create a #SoupMessage with [ctor@Message.new] or
 * [ctor@Message.new_from_uri], set up its fields appropriately, and send it.
 * 
 * [property@Message:status-code] will normally be a [enum@Status] value, eg,
 * %SOUP_STATUS_OK, though of course it might actually be an unknown status
 * code. [property@Message:reason-phrase] is the actual text returned from the
 * server, which may or may not correspond to the "standard" description of
 * @status_code. At any rate, it is almost certainly not localized, and not very
 * descriptive even if it is in the user's language; you should not use
 * [property@Message:reason-phrase] in user-visible messages. Rather, you should
 * look at [property@Message:status-code], and determine an end-user-appropriate
 * message based on that and on what you were trying to do.
 * 
 * Note that libsoup's terminology here does not quite match the HTTP
 * specification: in RFC 2616, an "HTTP-message" is *either* a Request, *or* a
 * Response. In libsoup, a #SoupMessage combines both the request and the
 * response.
 */
public class Message : ObjectG
{
	/** the main Gtk struct */
	protected SoupMessage* soupMessage;

	/** Get the main Gtk struct */
	public SoupMessage* getMessageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupMessage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupMessage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupMessage* soupMessage, bool ownedRef = false)
	{
		this.soupMessage = soupMessage;
		super(cast(GObject*)soupMessage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_message_get_type();
	}

	/**
	 * Creates a new empty #SoupMessage, which will connect to @uri.
	 *
	 * Params:
	 *     method = the HTTP method for the created request
	 *     uriString = the destination endpoint (as a string)
	 *
	 * Returns: the new #SoupMessage (or %NULL if @uri
	 *     could not be parsed).
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string method, string uriString)
	{
		auto __p = soup_message_new(Str.toStringz(method), Str.toStringz(uriString));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupMessage*) __p, true);
	}

	/**
	 * Creates a new #SoupMessage and sets it up to send the given @encoded_form
	 * to @uri via @method. If @method is "GET", it will include the form data
	 * into @uri's query field, and if @method is "POST" or "PUT", it will be set as
	 * request body.
	 *
	 * This function takes the ownership of @encoded_form, that will be released
	 * with [func@GLib.free] when no longer in use. See also [func@form_encode],
	 * [func@form_encode_hash] and [func@form_encode_datalist].
	 *
	 * Params:
	 *     method = the HTTP method for the created request (GET, POST or PUT)
	 *     uriString = the destination endpoint (as a string)
	 *     encodedForm = a encoded form
	 *
	 * Returns: the new #SoupMessage, or %NULL if
	 *     @uri_string could not be parsed or @method is not "GET, "POST" or "PUT"
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string method, string uriString, string encodedForm)
	{
		auto __p = soup_message_new_from_encoded_form(Str.toStringz(method), Str.toStringz(uriString), Str.toStringz(encodedForm));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_encoded_form");
		}

		this(cast(SoupMessage*) __p, true);
	}

	/**
	 * Creates a new #SoupMessage and sets it up to send @multipart to
	 * @uri_string via POST.
	 *
	 * Params:
	 *     uriString = the destination endpoint
	 *     multipart = a #SoupMultipart
	 *
	 * Returns: the new #SoupMessage, or %NULL if @uri_string
	 *     could not be parsed
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string uriString, Multipart multipart)
	{
		auto __p = soup_message_new_from_multipart(Str.toStringz(uriString), (multipart is null) ? null : multipart.getMultipartStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_multipart");
		}

		this(cast(SoupMessage*) __p, true);
	}

	/**
	 * Creates a new empty #SoupMessage, which will connect to @uri.
	 *
	 * Params:
	 *     method = the HTTP method for the created request
	 *     uri = the destination endpoint
	 *
	 * Returns: the new #SoupMessage
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string method, Uri uri)
	{
		auto __p = soup_message_new_from_uri(Str.toStringz(method), (uri is null) ? null : uri.getUriStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_uri");
		}

		this(cast(SoupMessage*) __p, true);
	}

	/**
	 * Creates a new #SoupMessage to send `OPTIONS *` to a server. The path of
	 * @base_uri will be ignored.
	 *
	 * Params:
	 *     baseUri = the destination endpoint
	 *
	 * Returns: the new #SoupMessage
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Uri baseUri)
	{
		auto __p = soup_message_new_options_ping((baseUri is null) ? null : baseUri.getUriStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_options_ping");
		}

		this(cast(SoupMessage*) __p, true);
	}

	/**
	 * Adds @flags to the set of @msg's flags.
	 *
	 * Params:
	 *     flags = a set of #SoupMessageFlags values
	 */
	public void addFlags(SoupMessageFlags flags)
	{
		soup_message_add_flags(soupMessage, flags);
	}

	/**
	 * Adds a signal handler to @msg for @signal.
	 *
	 * Similar to [func@GObject.signal_connect], but the @callback will only be run
	 * if @msg's incoming messages headers (that is, the `request_headers`) contain
	 * a header named @header.
	 *
	 * Params:
	 *     signal = signal to connect the handler to.
	 *     header = HTTP response header to match against
	 *     callback = the header handler
	 *     userData = data to pass to @handler_cb
	 *
	 * Returns: the handler ID from [func@GObject.signal_connect]
	 */
	public uint addHeaderHandler(string signal, string header, GCallback callback, void* userData)
	{
		return soup_message_add_header_handler(soupMessage, Str.toStringz(signal), Str.toStringz(header), callback, userData);
	}

	/**
	 * Adds a signal handler to @msg for @signal.
	 *
	 * Similar to [func@GObject.signal_connect], but the @callback will only be run
	 * if @msg has the status @status_code.
	 *
	 * @signal must be a signal that will be emitted after @msg's status
	 * is set (this means it can't be a "wrote" signal).
	 *
	 * Params:
	 *     signal = signal to connect the handler to.
	 *     statusCode = status code to match against
	 *     callback = the header handler
	 *     userData = data to pass to @handler_cb
	 *
	 * Returns: the handler ID from [func@GObject.signal_connect]
	 */
	public uint addStatusCodeHandler(string signal, uint statusCode, GCallback callback, void* userData)
	{
		return soup_message_add_status_code_handler(soupMessage, Str.toStringz(signal), statusCode, callback, userData);
	}

	/**
	 * Disables the actions of [iface@SessionFeature]s with the
	 * given @feature_type (or a subclass of that type) on @msg.
	 *
	 * @msg is processed as though the feature(s) hadn't been added to the
	 * session. Eg, passing #SOUP_TYPE_CONTENT_SNIFFER for @feature_type
	 * will disable Content-Type sniffing on the message.
	 *
	 * You must call this before queueing @msg on a session; calling it on
	 * a message that has already been queued is undefined. In particular,
	 * you cannot call this on a message that is being requeued after a
	 * redirect or authentication.
	 *
	 * Params:
	 *     featureType = the #GType of a #SoupSessionFeature
	 */
	public void disableFeature(GType featureType)
	{
		soup_message_disable_feature(soupMessage, featureType);
	}

	/**
	 * Returns the unique idenfier for the last connection used.
	 *
	 * This may be 0 if it was a cached resource or it has not gotten
	 * a connection yet.
	 *
	 * Returns: An id or 0 if no connection.
	 */
	public ulong getConnectionId()
	{
		return soup_message_get_connection_id(soupMessage);
	}

	/**
	 * Gets @msg's first-party [struct@GLib.Uri].
	 *
	 * Returns: the @msg's first party #GUri
	 */
	public Uri getFirstParty()
	{
		auto __p = soup_message_get_first_party(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p);
	}

	/**
	 * Gets the flags on @msg.
	 *
	 * Returns: the flags
	 */
	public SoupMessageFlags getFlags()
	{
		return soup_message_get_flags(soupMessage);
	}

	/**
	 * Gets the HTTP version of @msg.
	 *
	 * This is the minimum of the version from the request and the version from the
	 * response.
	 *
	 * Returns: the HTTP version
	 */
	public SoupHTTPVersion getHttpVersion()
	{
		return soup_message_get_http_version(soupMessage);
	}

	/**
	 * Gets whether @msg is intended to be used to send `OPTIONS *` to a server.
	 *
	 * Returns: %TRUE if the message is options ping, or %FALSE otherwise
	 */
	public bool getIsOptionsPing()
	{
		return soup_message_get_is_options_ping(soupMessage) != 0;
	}

	/**
	 * Returns if this message is set as a top level navigation.
	 *
	 * Used for same-site policy checks.
	 *
	 * Returns: Whether the current request is a top-level navitation
	 */
	public bool getIsTopLevelNavigation()
	{
		return soup_message_get_is_top_level_navigation(soupMessage) != 0;
	}

	/**
	 * Returns the method of this message.
	 *
	 * Returns: A method such as %SOUP_METHOD_GET
	 */
	public string getMethod()
	{
		return Str.toString(soup_message_get_method(soupMessage));
	}

	/**
	 * Get the [struct@MessageMetrics] of @msg.
	 *
	 * If the flag %SOUP_MESSAGE_COLLECT_METRICS is not enabled for @msg this will
	 * return %NULL.
	 *
	 * Returns: a #SoupMessageMetrics
	 */
	public MessageMetrics getMetrics()
	{
		auto __p = soup_message_get_metrics(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageMetrics)(cast(SoupMessageMetrics*) __p);
	}

	/**
	 * Retrieves the [enum@MessagePriority].
	 *
	 * If not set this value defaults to #SOUP_MESSAGE_PRIORITY_NORMAL.
	 *
	 * Returns: the priority of the message.
	 */
	public SoupMessagePriority getPriority()
	{
		return soup_message_get_priority(soupMessage);
	}

	/**
	 * Returns the reason phrase for the status of this message.
	 *
	 * Returns: the phrase
	 */
	public string getReasonPhrase()
	{
		return Str.toString(soup_message_get_reason_phrase(soupMessage));
	}

	/**
	 * Get the remote [class@Gio.SocketAddress] of the connection associated with
	 * the message.
	 *
	 * The returned address can be %NULL if the connection hasn't been established
	 * yet, or the resource was loaded from the disk cache. In case of proxy
	 * connections, the remote address returned is a [class@Gio.ProxyAddress]. If
	 * [property@Session:remote-connectable] is set the returned address id for the
	 * connection to the session's remote connectable.
	 *
	 * Returns: a #GSocketAddress or %NULL if the connection
	 *     hasn't been established
	 */
	public SocketAddress getRemoteAddress()
	{
		auto __p = soup_message_get_remote_address(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SocketAddress)(cast(GSocketAddress*) __p);
	}

	/**
	 * Returns the headers sent with the request.
	 *
	 * Returns: The #SoupMessageHeaders
	 */
	public MessageHeaders getRequestHeaders()
	{
		auto __p = soup_message_get_request_headers(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageHeaders)(cast(SoupMessageHeaders*) __p);
	}

	/**
	 * Returns the headers recieved with the response.
	 *
	 * Returns: The #SoupMessageHeaders
	 */
	public MessageHeaders getResponseHeaders()
	{
		auto __p = soup_message_get_response_headers(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageHeaders)(cast(SoupMessageHeaders*) __p);
	}

	/**
	 * Gets @msg's site for cookies #GUri.
	 *
	 * Returns: the @msg's site for cookies #GUri
	 */
	public Uri getSiteForCookies()
	{
		auto __p = soup_message_get_site_for_cookies(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p);
	}

	/**
	 * Returns the set status of this message.
	 *
	 * Returns: The #SoupStatus
	 */
	public SoupStatus getStatus()
	{
		return soup_message_get_status(soupMessage);
	}

	/**
	 * Gets the name of the TLS ciphersuite negotiated for @msg's connection.
	 *
	 * Returns: the name of the TLS ciphersuite,
	 *     or %NULL if @msg's connection is not SSL.
	 */
	public string getTlsCiphersuiteName()
	{
		return Str.toString(soup_message_get_tls_ciphersuite_name(soupMessage));
	}

	/**
	 * Gets the peer's [class@Gio.TlsCertificate] associated with @msg's connection.
	 *
	 * Note that this is not set yet during the emission of
	 * [signal@Message::accept-certificate] signal.
	 *
	 * Returns: @msg's TLS peer certificate,
	 *     or %NULL if @msg's connection is not SSL.
	 */
	public TlsCertificate getTlsPeerCertificate()
	{
		auto __p = soup_message_get_tls_peer_certificate(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TlsCertificate)(cast(GTlsCertificate*) __p);
	}

	/**
	 * Gets the errors associated with validating @msg's TLS peer certificate.
	 * Note that this is not set yet during the emission of
	 * [signal@Message::accept-certificate] signal.
	 *
	 * Returns: a #GTlsCertificateFlags with @msg's TLS peer certificate errors.
	 */
	public GTlsCertificateFlags getTlsPeerCertificateErrors()
	{
		return soup_message_get_tls_peer_certificate_errors(soupMessage);
	}

	/**
	 * Gets the TLS protocol version negotiated for @msg's connection.
	 *
	 * If the message connection is not SSL, %G_TLS_PROTOCOL_VERSION_UNKNOWN is returned.
	 *
	 * Returns: a #GTlsProtocolVersion
	 */
	public GTlsProtocolVersion getTlsProtocolVersion()
	{
		return soup_message_get_tls_protocol_version(soupMessage);
	}

	/**
	 * Gets @msg's URI.
	 *
	 * Returns: the URI @msg is targeted for.
	 */
	public Uri getUri()
	{
		auto __p = soup_message_get_uri(soupMessage);

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p);
	}

	/**
	 * Get whether [iface@SessionFeature]s of the given @feature_type
	 * (or a subclass of that type) are disabled on @msg.
	 *
	 * See [method@Message.disable_feature].
	 *
	 * Params:
	 *     featureType = the #GType of a #SoupSessionFeature
	 *
	 * Returns: %TRUE if feature is disabled, or %FALSE otherwise.
	 */
	public bool isFeatureDisabled(GType featureType)
	{
		return soup_message_is_feature_disabled(soupMessage, featureType) != 0;
	}

	/**
	 * Determines whether or not @msg's connection can be kept alive for
	 * further requests after processing @msg.
	 *
	 * The result is based on the HTTP version, Connection header, etc.
	 *
	 * Returns: %TRUE or %FALSE.
	 */
	public bool isKeepalive()
	{
		return soup_message_is_keepalive(soupMessage) != 0;
	}

	/**
	 * Queries if @flags are present in the set of @msg's flags.
	 *
	 * Params:
	 *     flags = a set of #SoupMessageFlags values
	 *
	 * Returns: %TRUE if @flags are enabled in @msg
	 */
	public bool queryFlags(SoupMessageFlags flags)
	{
		return soup_message_query_flags(soupMessage, flags) != 0;
	}

	/**
	 * Removes @flags from the set of @msg's flags.
	 *
	 * Params:
	 *     flags = a set of #SoupMessageFlags values
	 */
	public void removeFlags(SoupMessageFlags flags)
	{
		soup_message_remove_flags(soupMessage, flags);
	}

	/**
	 * Sets @first_party as the main document #GUri for @msg.
	 *
	 * For details of when and how this is used refer to the documentation for
	 * [enum@CookieJarAcceptPolicy].
	 *
	 * Params:
	 *     firstParty = the #GUri for the @msg's first party
	 */
	public void setFirstParty(Uri firstParty)
	{
		soup_message_set_first_party(soupMessage, (firstParty is null) ? null : firstParty.getUriStruct());
	}

	/**
	 * Sets the specified flags on @msg.
	 *
	 * Params:
	 *     flags = a set of #SoupMessageFlags values
	 */
	public void setFlags(SoupMessageFlags flags)
	{
		soup_message_set_flags(soupMessage, flags);
	}

	/**
	 * Set whether @msg is intended to be used to send `OPTIONS *` to a server.
	 *
	 * When set to %TRUE, the path of [property@Message:uri] will be ignored and
	 * [property@Message:method] set to %SOUP_METHOD_OPTIONS.
	 *
	 * Params:
	 *     isOptionsPing = the value to set
	 */
	public void setIsOptionsPing(bool isOptionsPing)
	{
		soup_message_set_is_options_ping(soupMessage, isOptionsPing);
	}

	/**
	 * Sets whether the current request is a top-level navitation.
	 *
	 * See the [same-site spec](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00)
	 * for more information.
	 *
	 * Params:
	 *     isTopLevelNavigation = if %TRUE indicate the current request is a top-level navigation
	 */
	public void setIsTopLevelNavigation(bool isTopLevelNavigation)
	{
		soup_message_set_is_top_level_navigation(soupMessage, isTopLevelNavigation);
	}

	/**
	 * Set @msg's HTTP method to @method.
	 *
	 * Params:
	 *     method = the value to set
	 */
	public void setMethod(string method)
	{
		soup_message_set_method(soupMessage, Str.toStringz(method));
	}

	/**
	 * Sets the priority of a message.
	 *
	 * Note that this won't have any effect unless used before the message is added
	 * to the session's message processing queue.
	 *
	 * The message will be placed just before any other previously added
	 * message with lower priority (messages with the same priority are
	 * processed on a FIFO basis).
	 *
	 * Setting priorities does not currently work with synchronous messages
	 * because in the synchronous/blocking case, priority ends up being determined
	 * semi-randomly by thread scheduling.
	 *
	 * Params:
	 *     priority = the #SoupMessagePriority
	 */
	public void setPriority(SoupMessagePriority priority)
	{
		soup_message_set_priority(soupMessage, priority);
	}

	/**
	 * Set the request body of a #SoupMessage.
	 *
	 * If @content_type is %NULL and @stream is not %NULL the Content-Type header will
	 * not be changed if present.
	 * The request body needs to be set again in case @msg is restarted
	 * (in case of redirection or authentication).
	 *
	 * Params:
	 *     contentType = MIME Content-Type of the body, or %NULL if unknown
	 *     stream = a #GInputStream to read the request body from
	 *     contentLength = the byte length of @stream or -1 if unknown
	 */
	public void setRequestBody(string contentType, InputStream stream, ptrdiff_t contentLength)
	{
		soup_message_set_request_body(soupMessage, Str.toStringz(contentType), (stream is null) ? null : stream.getInputStreamStruct(), contentLength);
	}

	/**
	 * Set the request body of a #SoupMessage from [struct@GLib.Bytes].
	 *
	 * If @content_type is %NULL and @bytes is not %NULL the Content-Type header will
	 * not be changed if present.
	 * The request body needs to be set again in case @msg is restarted
	 * (in case of redirection or authentication).
	 *
	 * Params:
	 *     contentType = MIME Content-Type of the body, or %NULL if unknown
	 *     bytes = a #GBytes with the request body data
	 */
	public void setRequestBodyFromBytes(string contentType, Bytes bytes)
	{
		soup_message_set_request_body_from_bytes(soupMessage, Str.toStringz(contentType), (bytes is null) ? null : bytes.getBytesStruct());
	}

	/**
	 * Sets @site_for_cookies as the policy URL for same-site cookies for @msg.
	 *
	 * It is either the URL of the top-level document or %NULL depending on whether
	 * the registrable domain of this document's URL matches the registrable domain
	 * of its parent's/opener's URL. For the top-level document it is set to the
	 * document's URL.
	 *
	 * See the [same-site spec](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00)
	 * for more information.
	 *
	 * Params:
	 *     siteForCookies = the #GUri for the @msg's site for cookies
	 */
	public void setSiteForCookies(Uri siteForCookies)
	{
		soup_message_set_site_for_cookies(soupMessage, (siteForCookies is null) ? null : siteForCookies.getUriStruct());
	}

	/**
	 * Sets the @certificate to be used by @msg's connection when a
	 * client certificate is requested during the TLS handshake.
	 *
	 * You can call this as a response to [signal@Message::request-certificate]
	 * signal, or before the connection is started. If @certificate is %NULL
	 * the handshake will continue without providing a GTlsCertificate.
	 * Note that the [class@Gio.TlsCertificate] set by this function will be ignored if
	 * [property@Session:tls-interaction] is not %NULL.
	 *
	 * Params:
	 *     certificate = the #GTlsCertificate to set, or %NULL
	 */
	public void setTlsClientCertificate(TlsCertificate certificate)
	{
		soup_message_set_tls_client_certificate(soupMessage, (certificate is null) ? null : certificate.getTlsCertificateStruct());
	}

	/**
	 * Sets @msg's URI to @uri.
	 *
	 * If @msg has already been sent and you want to re-send it with the new URI,
	 * you need to send it again.
	 *
	 * Params:
	 *     uri = the new #GUri
	 */
	public void setUri(Uri uri)
	{
		soup_message_set_uri(soupMessage, (uri is null) ? null : uri.getUriStruct());
	}

	/**
	 * Completes a certificate password request.
	 *
	 * You must call this as a response to
	 * [signal@Message::request-certificate-password] signal, to notify @msg that
	 * the [class@Gio.TlsPassword] has already been updated.
	 */
	public void tlsClientCertificatePasswordRequestComplete()
	{
		soup_message_tls_client_certificate_password_request_complete(soupMessage);
	}

	/**
	 * Emitted during the @msg's connection TLS handshake
	 * after an unacceptable TLS certificate has been received.
	 *
	 * You can return %TRUE to accept @tls_certificate despite
	 * @tls_errors.
	 *
	 * Params:
	 *     tlsPeerCertificate = the peer's #GTlsCertificate
	 *     tlsPeerErrors = the tls errors of @tls_certificate
	 *
	 * Returns: %TRUE to accept the TLS certificate and stop other
	 *     handlers from being invoked, or %FALSE to propagate the
	 *     event further.
	 */
	gulong addOnAcceptCertificate(bool delegate(TlsCertificate, GTlsCertificateFlags, Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "accept-certificate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the message requires authentication.
	 *
	 * If credentials are available call [method@Auth.authenticate] on
	 * @auth. If these credentials fail, the signal will be emitted again,
	 * with @retrying set to %TRUE, which will continue until you return
	 * without calling [method@Auth.authenticate] on @auth.
	 *
	 * Note that this may be emitted before @msg's body has been
	 * fully read.
	 *
	 * You can authenticate @auth asynchronously by calling
	 * [method@GObject.Object.ref] on @auth and returning %TRUE. The operation will
	 * complete once either [method@Auth.authenticate] or
	 * [method@Auth.cancel] are called.
	 *
	 * Params:
	 *     auth = the #SoupAuth to authenticate
	 *     retrying = %TRUE if this is the second (or later) attempt
	 *
	 * Returns: %TRUE to stop other handlers from being invoked
	 *     or %FALSE to propagate the event further.
	 */
	gulong addOnAuthenticate(bool delegate(Auth, bool, Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "authenticate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This signal is emitted after [signal@Message::got-headers].
	 *
	 * If content sniffing is disabled, or no content sniffing will be
	 * performed, due to the sniffer deciding to trust the
	 * Content-Type sent by the server, this signal is emitted
	 * immediately after [signal@Message::got-headers], and @type is
	 * %NULL.
	 *
	 * Params:
	 *     type = the content type that we got from sniffing
	 *     params = a #GHashTable with the parameters
	 */
	gulong addOnContentSniffed(void delegate(string, HashTable, Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "content-sniffed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when all HTTP processing is finished for a message.
	 *
	 * (After [signal@Message::got_body]).
	 */
	gulong addOnFinished(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "finished", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted after receiving the complete message request body.
	 *
	 * See also [method@Message.add_header_handler] and
	 * [method@Message.add_status_code_handler], which can be used
	 * to connect to a subset of emissions of this signal.
	 */
	gulong addOnGotBody(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "got-body", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted after receiving the Status-Line and response headers.
	 *
	 * See also [method@Message.add_header_handler] and
	 * [method@Message.add_status_code_handler], which can be used to
	 * connect to a subset of emissions of this signal.
	 *
	 * If you cancel or requeue @msg while processing this signal,
	 * then the current HTTP I/O will be stopped after this signal
	 * emission finished, and @msg's connection will be closed.
	 * (If you need to requeue a message--eg, after handling
	 * authentication or redirection--it is usually better to
	 * requeue it from a [signal@Message::got-body] handler rather
	 * than a [signal@Message::got_headers] handler, so that the
	 * existing HTTP connection can be reused.)
	 */
	gulong addOnGotHeaders(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "got-headers", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted after receiving a 1xx (Informational) response for
	 * a (client-side) message.
	 *
	 * The response_headers will be filled in with the headers associated
	 * with the informational response; however, those header values will be
	 * erased after this signal is done.
	 *
	 * If you cancel or requeue @msg while processing this signal,
	 * then the current HTTP I/O will be stopped after this signal
	 * emission finished, and @msg's connection will be closed.
	 */
	gulong addOnGotInformational(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "got-informational", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when [class@HSTSEnforcer] has upgraded the protocol
	 * for @msg to HTTPS as a result of matching its domain with
	 * a HSTS policy.
	 */
	gulong addOnHstsEnforced(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "hsts-enforced", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted to indicate that some network-related event
	 * related to @msg has occurred.
	 *
	 * This essentially proxies the [signal@Gio.SocketClient::event] signal,
	 * but only for events that occur while @msg "owns" the connection; if
	 * @msg is sent on an existing persistent connection, then this signal
	 * will not be emitted. (If you want to force the message to be sent on
	 * a new connection, set the %SOUP_MESSAGE_NEW_CONNECTION flag on it.)
	 *
	 * See [signal@Gio.SocketClient::event] for more information on what
	 * the different values of @event correspond to, and what
	 * @connection will be in each case.
	 *
	 * Params:
	 *     event = the network event
	 *     connection = the current state of the network connection
	 */
	gulong addOnNetwork(void delegate(GSocketClientEvent, IOStream, Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "network-event", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted during the @msg's connection TLS handshake when
	 * @tls_connection requests a certificate from the client.
	 *
	 * You can set the client certificate by calling
	 * [method@Message.set_tls_client_certificate] and returning %TRUE. It's
	 * possible to handle the request asynchornously by returning %TRUE and
	 * call [method@Message.set_tls_client_certificate] later once the
	 * certificate is available. Note that this signal is not emitted if
	 * [property@Session:tls-interaction] was set, or if
	 * [method@Message.set_tls_client_certificate] was called before the
	 * connection TLS handshake started.
	 *
	 * Params:
	 *     tlsConnection = the #GTlsClientConnection
	 *
	 * Returns: %TRUE to handle the request, or %FALSE to make the connection
	 *     fail with %G_TLS_ERROR_CERTIFICATE_REQUIRED.
	 */
	gulong addOnRequestCertificate(bool delegate(TlsClientConnectionIF, Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-certificate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted during the @msg's connection TLS handshake when
	 * @tls_connection requests a certificate password from the client.
	 *
	 * You can set the certificate password on @password, then call
	 * [method@Message.tls_client_certificate_password_request_complete] and
	 * return %TRUE to handle the signal synchronously. It's possible to
	 * handle the request asynchornously by calling
	 * [method@GObject.Object.ref] on @password, then returning %TRUE and
	 * call
	 * [method@Message.tls_client_certificate_password_request_complete]
	 * later after setting the password on @password. Note that this signal
	 * is not emitted if [property@Session:tls-interaction] was set.
	 *
	 * Params:
	 *     tlsPassword = the #GTlsPassword
	 *
	 * Returns: %TRUE to handle the request, or %FALSE to make the connection
	 *     fail with %G_TLS_ERROR_CERTIFICATE_REQUIRED.
	 */
	gulong addOnRequestCertificatePassword(bool delegate(TlsPassword, Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-certificate-password", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when a request that was already sent once is now
	 * being sent again.
	 *
	 * e.g. because the first attempt received a
	 * redirection response, or because we needed to use
	 * authentication.
	 */
	gulong addOnRestarted(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "restarted", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted just before a message is sent.
	 */
	gulong addOnStarting(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "starting", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing the complete body for a
	 * message.
	 */
	gulong addOnWroteBody(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-body", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing a portion of the message
	 * body to the network.
	 *
	 * Params:
	 *     chunkSize = the number of bytes written
	 */
	gulong addOnWroteBodyData(void delegate(uint, Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-body-data", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing the request headers for a
	 * message.
	 */
	gulong addOnWroteHeaders(void delegate(Message) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-headers", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
