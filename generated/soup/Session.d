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


module soup.Session;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.InetSocketAddress;
private import gio.InputStream;
private import gio.ProxyResolverIF;
private import gio.SocketConnectableIF;
private import gio.TlsDatabase;
private import gio.TlsInteraction;
private import glib.Bytes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import soup.Message;
private import soup.SessionFeatureIF;
private import soup.WebsocketConnection;
private import soup.c.functions;
public  import soup.c.types;
private import std.algorithm;


/**
 * Soup session state object.
 * 
 * #SoupSession is the object that controls client-side HTTP. A
 * #SoupSession encapsulates all of the state that libsoup is keeping
 * on behalf of your program; cached HTTP connections, authentication
 * information, etc. It also keeps track of various global options
 * and features that you are using.
 * 
 * Most applications will only need a single #SoupSession; the primary
 * reason you might need multiple sessions is if you need to have
 * multiple independent authentication contexts. (Eg, you are
 * connecting to a server and authenticating as two different users at
 * different times; the easiest way to ensure that each [class@Message]
 * is sent with the authentication information you intended is to use
 * one session for the first user, and a second session for the other
 * user.)
 * 
 * Additional #SoupSession functionality is provided by
 * [iface@SessionFeature] objects, which can be added to a session with
 * [method@Session.add_feature] or [method@Session.add_feature_by_type]
 * For example, [class@Logger] provides support for
 * logging HTTP traffic, [class@ContentDecoder] provides support for
 * compressed response handling, and [class@ContentSniffer] provides
 * support for HTML5-style response body content sniffing.
 * Additionally, subtypes of [class@Auth] can be added
 * as features, to add support for additional authentication types.
 * 
 * All `SoupSession`s are created with a [class@AuthManager], and support
 * for %SOUP_TYPE_AUTH_BASIC and %SOUP_TYPE_AUTH_DIGEST. Additionally,
 * sessions using the plain #SoupSession class (rather than one of its deprecated
 * subtypes) have a [class@ContentDecoder] by default.
 * 
 * Note that all async methods will invoke their callbacks on the thread-default
 * context at the time of the function call.
 */
public class Session : ObjectG
{
	/** the main Gtk struct */
	protected SoupSession* soupSession;

	/** Get the main Gtk struct */
	public SoupSession* getSessionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupSession;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupSession;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupSession* soupSession, bool ownedRef = false)
	{
		this.soupSession = soupSession;
		super(cast(GObject*)soupSession, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_session_get_type();
	}

	/**
	 * Creates a #SoupSession with the default options.
	 *
	 * Returns: the new session.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = soup_session_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupSession*) __p, true);
	}

	/**
	 * Cancels all pending requests in @session and closes all idle
	 * persistent connections.
	 */
	public void abort()
	{
		soup_session_abort(soupSession);
	}

	/**
	 * Adds @feature's functionality to @session. You cannot add multiple
	 * features of the same [alias@GLib.Type] to a session.
	 *
	 * See the main #SoupSession documentation for information on what
	 * features are present in sessions by default.
	 *
	 * Params:
	 *     feature = an object that implements #SoupSessionFeature
	 */
	public void addFeature(SessionFeatureIF feature)
	{
		soup_session_add_feature(soupSession, (feature is null) ? null : feature.getSessionFeatureStruct());
	}

	/**
	 * If @feature_type is the type of a class that implements
	 * [iface@SessionFeature], this creates a new feature of that type and
	 * adds it to @session as with [method@Session.add_feature]. You can use
	 * this when you don't need to customize the new feature in any way.
	 * Adding multiple features of the same @feature_type is not allowed.
	 *
	 * If @feature_type is not a [iface@SessionFeature] type, this gives each
	 * existing feature on @session the chance to accept @feature_type as
	 * a "subfeature". This can be used to add new [class@Auth] types, for instance.
	 *
	 * See the main #SoupSession documentation for information on what
	 * features are present in sessions by default.
	 *
	 * Params:
	 *     featureType = a #GType
	 */
	public void addFeatureByType(GType featureType)
	{
		soup_session_add_feature_by_type(soupSession, featureType);
	}

	/**
	 * Get the value used by @session for the "Accept-Language" header on new
	 * requests.
	 *
	 * Returns: the accept language string
	 */
	public string getAcceptLanguage()
	{
		return Str.toString(soup_session_get_accept_language(soupSession));
	}

	/**
	 * Gets whether @session automatically sets the "Accept-Language" header on new
	 * requests.
	 *
	 * Returns: %TRUE if @session sets "Accept-Language" header automatically, or
	 *     %FALSE otherwise.
	 */
	public bool getAcceptLanguageAuto()
	{
		return soup_session_get_accept_language_auto(soupSession) != 0;
	}

	/**
	 * Gets the [class@Message] of the @result asynchronous operation This is useful
	 * to get the [class@Message] of an asynchronous operation started by @session
	 * from its [callback@Gio.AsyncReadyCallback].
	 *
	 * Params:
	 *     result = the #GAsyncResult passed to your callback
	 *
	 * Returns: a #SoupMessage or
	 *     %NULL if @result is not a valid @session async operation result.
	 */
	public Message getAsyncResultMessage(AsyncResultIF result)
	{
		auto __p = soup_session_get_async_result_message(soupSession, (result is null) ? null : result.getAsyncResultStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Message)(cast(SoupMessage*) __p);
	}

	/**
	 * Gets the feature in @session of type @feature_type.
	 *
	 * Params:
	 *     featureType = the #GType of the feature to get
	 *
	 * Returns: a #SoupSessionFeature, or %NULL. The
	 *     feature is owned by @session.
	 */
	public SessionFeatureIF getFeature(GType featureType)
	{
		auto __p = soup_session_get_feature(soupSession, featureType);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SessionFeatureIF)(cast(SoupSessionFeature*) __p);
	}

	/**
	 * Gets the feature in @session of type @feature_type, provided
	 * that it is not disabled for @msg.
	 *
	 * Params:
	 *     featureType = the #GType of the feature to get
	 *     msg = a #SoupMessage
	 *
	 * Returns: a #SoupSessionFeature. The feature is
	 *     owned by @session.
	 */
	public SessionFeatureIF getFeatureForMessage(GType featureType, Message msg)
	{
		auto __p = soup_session_get_feature_for_message(soupSession, featureType, (msg is null) ? null : msg.getMessageStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SessionFeatureIF)(cast(SoupSessionFeature*) __p);
	}

	/**
	 * Get the timeout in seconds for idle connection lifetime currently used by
	 * @session.
	 *
	 * Returns: the timeout in seconds
	 */
	public uint getIdleTimeout()
	{
		return soup_session_get_idle_timeout(soupSession);
	}

	/**
	 * Get the [class@Gio.InetSocketAddress] to use for the client side of
	 * connections in @session.
	 *
	 * Returns: a #GInetSocketAddress
	 */
	public InetSocketAddress getLocalAddress()
	{
		auto __p = soup_session_get_local_address(soupSession);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(InetSocketAddress)(cast(GInetSocketAddress*) __p);
	}

	/**
	 * Get the maximum number of connections that @session can open at once.
	 *
	 * Returns: the maximum number of connections
	 */
	public uint getMaxConns()
	{
		return soup_session_get_max_conns(soupSession);
	}

	/**
	 * Get the maximum number of connections that @session can open at once to a
	 * given host.
	 *
	 * Returns: the maximum number of connections per host
	 */
	public uint getMaxConnsPerHost()
	{
		return soup_session_get_max_conns_per_host(soupSession);
	}

	/**
	 * Get the [iface@Gio.ProxyResolver] currently used by @session.
	 *
	 * Returns: a #GProxyResolver or %NULL if proxies
	 *     are disabled in @session
	 */
	public ProxyResolverIF getProxyResolver()
	{
		auto __p = soup_session_get_proxy_resolver(soupSession);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ProxyResolverIF)(cast(GProxyResolver*) __p);
	}

	/**
	 * Gets the remote connectable if one set.
	 *
	 * Returns: the #GSocketConnectable
	 */
	public SocketConnectableIF getRemoteConnectable()
	{
		auto __p = soup_session_get_remote_connectable(soupSession);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SocketConnectableIF)(cast(GSocketConnectable*) __p);
	}

	/**
	 * Get the timeout in seconds for socket I/O operations currently used by
	 * @session.
	 *
	 * Returns: the timeout in seconds
	 */
	public uint getTimeout()
	{
		return soup_session_get_timeout(soupSession);
	}

	/**
	 * Get the [class@Gio.TlsDatabase] currently used by @session.
	 *
	 * Returns: a #GTlsDatabase
	 */
	public TlsDatabase getTlsDatabase()
	{
		auto __p = soup_session_get_tls_database(soupSession);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TlsDatabase)(cast(GTlsDatabase*) __p);
	}

	/**
	 * Get the [class@Gio.TlsInteraction] currently used by @session.
	 *
	 * Returns: a #GTlsInteraction
	 */
	public TlsInteraction getTlsInteraction()
	{
		auto __p = soup_session_get_tls_interaction(soupSession);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TlsInteraction)(cast(GTlsInteraction*) __p);
	}

	/**
	 * Get the value used by @session for the "User-Agent" header on new requests.
	 *
	 * Returns: the user agent string
	 */
	public string getUserAgent()
	{
		return Str.toString(soup_session_get_user_agent(soupSession));
	}

	/**
	 * Tests if @session has at a feature of type @feature_type (which can
	 * be the type of either a [iface@SessionFeature], or else a subtype of
	 * some class managed by another feature, such as [class@Auth]).
	 *
	 * Params:
	 *     featureType = the #GType of the class of features to check for
	 *
	 * Returns: %TRUE or %FALSE
	 */
	public bool hasFeature(GType featureType)
	{
		return soup_session_has_feature(soupSession, featureType) != 0;
	}

	/**
	 * Start a preconnection to @msg.
	 *
	 * Once the connection is done, it will remain in idle state so that it can be
	 * reused by future requests. If there's already an idle connection for the
	 * given @msg host, the operation finishes successfully without creating a new
	 * connection. If a new request for the given @msg host is made while the
	 * preconnect is still ongoing, the request will take the ownership of the
	 * connection and the preconnect operation will finish successfully (if there's
	 * a connection error it will be handled by the request).
	 *
	 * The operation finishes when the connection is done or an error occurred.
	 *
	 * Params:
	 *     msg = a #SoupMessage
	 *     ioPriority = the I/O priority of the request
	 *     cancellable = a #GCancellable
	 *     callback = the callback to invoke when the operation finishes
	 *     userData = data for @progress_callback and @callback
	 */
	public void preconnectAsync(Message msg, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		soup_session_preconnect_async(soupSession, (msg is null) ? null : msg.getMessageStruct(), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Complete a preconnect async operation started with [method@Session.preconnect_async].
	 *
	 * Params:
	 *     result = the #GAsyncResult passed to your callback
	 *
	 * Returns: %TRUE if the preconnect succeeded, or %FALSE in case of error.
	 *
	 * Throws: GException on failure.
	 */
	public bool preconnectFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = soup_session_preconnect_finish(soupSession, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Removes @feature's functionality from @session.
	 *
	 * Params:
	 *     feature = a feature that has previously been added to @session
	 */
	public void removeFeature(SessionFeatureIF feature)
	{
		soup_session_remove_feature(soupSession, (feature is null) ? null : feature.getSessionFeatureStruct());
	}

	/**
	 * Removes all features of type @feature_type (or any subclass of
	 * @feature_type) from @session.
	 *
	 * Params:
	 *     featureType = a #GType
	 */
	public void removeFeatureByType(GType featureType)
	{
		soup_session_remove_feature_by_type(soupSession, featureType);
	}

	/**
	 * Synchronously sends @msg and waits for the beginning of a response.
	 *
	 * On success, a [class@Gio.InputStream] will be returned which you can use to
	 * read the response body. ("Success" here means only that an HTTP
	 * response was received and understood; it does not necessarily mean
	 * that a 2xx class status code was received.)
	 *
	 * If non-%NULL, @cancellable can be used to cancel the request;
	 * [method@Session.send] will return a %G_IO_ERROR_CANCELLED error. Note that
	 * with requests that have side effects (eg, `POST`, `PUT`, `DELETE`) it is
	 * possible that you might cancel the request after the server acts on it, but
	 * before it returns a response, leaving the remote resource in an unknown
	 * state.
	 *
	 * If @msg is requeued due to a redirect or authentication, the
	 * initial (`3xx/401/407`) response body will be suppressed, and
	 * [method@Session.send] will only return once a final response has been
	 * received.
	 *
	 * Params:
	 *     msg = a #SoupMessage
	 *     cancellable = a #GCancellable
	 *
	 * Returns: a #GInputStream for reading the
	 *     response body, or %NULL on error.
	 *
	 * Throws: GException on failure.
	 */
	public InputStream send(Message msg, Cancellable cancellable)
	{
		GError* err = null;

		auto __p = soup_session_send(soupSession, (msg is null) ? null : msg.getMessageStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) __p, true);
	}

	/**
	 * Synchronously sends @msg and reads the response body.
	 *
	 * On success, a [struct@GLib.Bytes] will be returned with the response body.
	 * This function should only be used when the resource to be retrieved
	 * is not too long and can be stored in memory.
	 *
	 * See [method@Session.send] for more details on the general semantics.
	 *
	 * Params:
	 *     msg = a #SoupMessage
	 *     cancellable = a #GCancellable
	 *
	 * Returns: a #GBytes, or %NULL on error.
	 *
	 * Throws: GException on failure.
	 */
	public Bytes sendAndRead(Message msg, Cancellable cancellable)
	{
		GError* err = null;

		auto __p = soup_session_send_and_read(soupSession, (msg is null) ? null : msg.getMessageStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);

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
	 * Asynchronously sends @msg and reads the response body.
	 *
	 * When @callback is called, then either @msg has been sent, and its response
	 * body read, or else an error has occurred. This function should only be used
	 * when the resource to be retrieved is not too long and can be stored in
	 * memory. Call [method@Session.send_and_read_finish] to get a
	 * [struct@GLib.Bytes] with the response body.
	 *
	 * See [method@Session.send] for more details on the general semantics.
	 *
	 * Params:
	 *     msg = a #SoupMessage
	 *     ioPriority = the I/O priority of the request
	 *     cancellable = a #GCancellable
	 *     callback = the callback to invoke
	 *     userData = data for @callback
	 */
	public void sendAndReadAsync(Message msg, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		soup_session_send_and_read_async(soupSession, (msg is null) ? null : msg.getMessageStruct(), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Gets the response to a [method@Session.send_and_read_async].
	 *
	 * If successful, returns a [struct@GLib.Bytes] with the response body.
	 *
	 * Params:
	 *     result = the #GAsyncResult passed to your callback
	 *
	 * Returns: a #GBytes, or %NULL on error.
	 *
	 * Throws: GException on failure.
	 */
	public Bytes sendAndReadFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = soup_session_send_and_read_finish(soupSession, (result is null) ? null : result.getAsyncResultStruct(), &err);

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
	 * Asynchronously sends @msg and waits for the beginning of a response.
	 *
	 * When @callback is called, then either @msg has been sent, and its response
	 * headers received, or else an error has occurred. Call
	 * [method@Session.send_finish] to get a [class@Gio.InputStream] for reading the
	 * response body.
	 *
	 * See [method@Session.send] for more details on the general semantics.
	 *
	 * Params:
	 *     msg = a #SoupMessage
	 *     ioPriority = the I/O priority of the request
	 *     cancellable = a #GCancellable
	 *     callback = the callback to invoke
	 *     userData = data for @callback
	 */
	public void sendAsync(Message msg, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		soup_session_send_async(soupSession, (msg is null) ? null : msg.getMessageStruct(), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Gets the response to a [method@Session.send_async] call.
	 *
	 * If successful returns a [class@Gio.InputStream] that can be used to read the
	 * response body.
	 *
	 * Params:
	 *     result = the #GAsyncResult passed to your callback
	 *
	 * Returns: a #GInputStream for reading the
	 *     response body, or %NULL on error.
	 *
	 * Throws: GException on failure.
	 */
	public InputStream sendFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = soup_session_send_finish(soupSession, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) __p, true);
	}

	/**
	 * Set the value to use for the "Accept-Language" header on [class@Message]s
	 * sent from @session.
	 *
	 * If @accept_language is %NULL then no "Accept-Language" will be included in
	 * requests. See [property@Session:accept-language] for more information.
	 *
	 * Params:
	 *     acceptLanguage = the languages string
	 */
	public void setAcceptLanguage(string acceptLanguage)
	{
		soup_session_set_accept_language(soupSession, Str.toStringz(acceptLanguage));
	}

	/**
	 * Set whether @session will automatically set the "Accept-Language" header on
	 * requests using a value generated from system languages based on
	 * [func@GLib.get_language_names].
	 *
	 * See [property@Session:accept-language-auto] for more information.
	 *
	 * Params:
	 *     acceptLanguageAuto = the value to set
	 */
	public void setAcceptLanguageAuto(bool acceptLanguageAuto)
	{
		soup_session_set_accept_language_auto(soupSession, acceptLanguageAuto);
	}

	/**
	 * Set a timeout in seconds for idle connection lifetime to be used by @session
	 * on new connections.
	 *
	 * See [property@Session:idle-timeout] for more information.
	 *
	 * Params:
	 *     timeout = a timeout in seconds
	 */
	public void setIdleTimeout(uint timeout)
	{
		soup_session_set_idle_timeout(soupSession, timeout);
	}

	/**
	 * Set a [iface@Gio.ProxyResolver] to be used by @session on new connections.
	 *
	 * If @proxy_resolver is %NULL then no proxies will be used. See
	 * [property@Session:proxy-resolver] for more information.
	 *
	 * Params:
	 *     proxyResolver = a #GProxyResolver or %NULL
	 */
	public void setProxyResolver(ProxyResolverIF proxyResolver)
	{
		soup_session_set_proxy_resolver(soupSession, (proxyResolver is null) ? null : proxyResolver.getProxyResolverStruct());
	}

	/**
	 * Set a timeout in seconds for socket I/O operations to be used by @session
	 * on new connections.
	 *
	 * See [property@Session:timeout] for more information.
	 *
	 * Params:
	 *     timeout = a timeout in seconds
	 */
	public void setTimeout(uint timeout)
	{
		soup_session_set_timeout(soupSession, timeout);
	}

	/**
	 * Set a [class@GIo.TlsDatabase] to be used by @session on new connections.
	 *
	 * If @tls_database is %NULL then certificate validation will always fail. See
	 * [property@Session:tls-database] for more information.
	 *
	 * Params:
	 *     tlsDatabase = a #GTlsDatabase
	 */
	public void setTlsDatabase(TlsDatabase tlsDatabase)
	{
		soup_session_set_tls_database(soupSession, (tlsDatabase is null) ? null : tlsDatabase.getTlsDatabaseStruct());
	}

	/**
	 * Set a [class@Gio.TlsInteraction] to be used by @session on new connections.
	 *
	 * If @tls_interaction is %NULL then client certificate validation will always
	 * fail.
	 *
	 * See [property@Session:tls-interaction] for more information.
	 *
	 * Params:
	 *     tlsInteraction = a #GTlsInteraction
	 */
	public void setTlsInteraction(TlsInteraction tlsInteraction)
	{
		soup_session_set_tls_interaction(soupSession, (tlsInteraction is null) ? null : tlsInteraction.getTlsInteractionStruct());
	}

	/**
	 * Set the value to use for the "User-Agent" header on [class@Message]s sent
	 * from @session.
	 *
	 * If @user_agent has trailing whitespace, @session will append its own product
	 * token (eg, `libsoup/3.0.0`) to the end of the header for you. If @user_agent
	 * is %NULL then no "User-Agent" will be included in requests. See
	 * [property@Session:user-agent] for more information.
	 *
	 * Params:
	 *     userAgent = the user agent string
	 */
	public void setUserAgent(string userAgent)
	{
		soup_session_set_user_agent(soupSession, Str.toStringz(userAgent));
	}

	/**
	 * Asynchronously creates a [class@WebsocketConnection] to communicate with a
	 * remote server.
	 *
	 * All necessary WebSocket-related headers will be added to @msg, and
	 * it will then be sent and asynchronously processed normally
	 * (including handling of redirection and HTTP authentication).
	 *
	 * If the server returns "101 Switching Protocols", then @msg's status
	 * code and response headers will be updated, and then the WebSocket
	 * handshake will be completed. On success,
	 * [method@Session.websocket_connect_finish] will return a new
	 * [class@WebsocketConnection]. On failure it will return a #GError.
	 *
	 * If the server returns a status other than "101 Switching Protocols", then
	 * @msg will contain the complete response headers and body from the server's
	 * response, and [method@Session.websocket_connect_finish] will return
	 * %SOUP_WEBSOCKET_ERROR_NOT_WEBSOCKET.
	 *
	 * Params:
	 *     msg = #SoupMessage indicating the WebSocket server to connect to
	 *     origin = origin of the connection
	 *     protocols = a
	 *         %NULL-terminated array of protocols supported
	 *     ioPriority = the I/O priority of the request
	 *     cancellable = a #GCancellable
	 *     callback = the callback to invoke
	 *     userData = data for @callback
	 */
	public void websocketConnectAsync(Message msg, string origin, string[] protocols, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		soup_session_websocket_connect_async(soupSession, (msg is null) ? null : msg.getMessageStruct(), Str.toStringz(origin), Str.toStringzArray(protocols), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Gets the [class@WebsocketConnection] response to a
	 * [method@Session.websocket_connect_async] call.
	 *
	 * If successful, returns a [class@WebsocketConnection] that can be used to
	 * communicate with the server.
	 *
	 * Params:
	 *     result = the #GAsyncResult passed to your callback
	 *
	 * Returns: a new #SoupWebsocketConnection, or
	 *     %NULL on error.
	 *
	 * Throws: GException on failure.
	 */
	public WebsocketConnection websocketConnectFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = soup_session_websocket_connect_finish(soupSession, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(WebsocketConnection)(cast(SoupWebsocketConnection*) __p, true);
	}

	/**
	 * Emitted when a request is queued on @session.
	 *
	 * When sending a request, first [signal@Session::request-queued]
	 * is emitted, indicating that the session has become aware of
	 * the request.
	 *
	 * After a connection is available to send the request various
	 * [class@Message] signals are emitted as the message is
	 * processed. If the message is requeued, it will emit
	 * [signal@Message::restarted], which will then be followed by other
	 * [class@Message] signals when the message is re-sent.
	 *
	 * Eventually, the message will emit [signal@Message::finished].
	 * Normally, this signals the completion of message
	 * processing. However, it is possible that the application
	 * will requeue the message from the "finished" handler.
	 * In that case the process will loop back.
	 *
	 * Eventually, a message will reach "finished" and not be
	 * requeued. At that point, the session will emit
	 * [signal@Session::request-unqueued] to indicate that it is done
	 * with the message.
	 *
	 * To sum up: [signal@Session::request-queued] and
	 * [signal@Session::request-unqueued] are guaranteed to be emitted
	 * exactly once, but [signal@Message::finished] (and all of the other
	 * [class@Message] signals) may be invoked multiple times for a given
	 * message.
	 *
	 * Params:
	 *     msg = the request that was queued
	 */
	gulong addOnRequestQueued(void delegate(Message, Session) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-queued", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when a request is removed from @session's queue,
	 * indicating that @session is done with it.
	 *
	 * See [signal@Session::request-queued] for a detailed description of
	 * the message lifecycle within a session.
	 *
	 * Params:
	 *     msg = the request that was unqueued
	 */
	gulong addOnRequestUnqueued(void delegate(Message, Session) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-unqueued", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
