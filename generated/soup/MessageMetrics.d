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


module soup.MessageMetrics;

private import gobject.ObjectG;
private import soup.c.functions;
public  import soup.c.types;


/**
 * Contains metrics collected while loading a [class@Message] either from the
 * network or the disk cache.
 * 
 * Metrics are not collected by default for a [class@Message], you need to add the
 * flag %SOUP_MESSAGE_COLLECT_METRICS to enable the feature.
 * 
 * Temporal metrics are expressed as a monotonic time and always start with a
 * fetch start event and finish with response end. All other events are optional.
 * An event can be 0 because it hasn't happened yet, because it's optional or
 * because the load failed before the event reached.
 * 
 * Size metrics are expressed in bytes and aree updated while the [class@Message] is
 * being loaded. You can connect to different [class@Message] signals to get the
 * final result of every value.
 */
public class MessageMetrics
{
	/** the main Gtk struct */
	protected SoupMessageMetrics* soupMessageMetrics;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public SoupMessageMetrics* getMessageMetricsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupMessageMetrics;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)soupMessageMetrics;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupMessageMetrics* soupMessageMetrics, bool ownedRef = false)
	{
		this.soupMessageMetrics = soupMessageMetrics;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( ownedRef )
			soup_message_metrics_free(soupMessageMetrics);
	}


	/** */
	public static GType getType()
	{
		return soup_message_metrics_get_type();
	}

	/**
	 * Copies @metrics.
	 *
	 * Returns: a copy of @metrics
	 */
	public MessageMetrics copy()
	{
		auto __p = soup_message_metrics_copy(soupMessageMetrics);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageMetrics)(cast(SoupMessageMetrics*) __p, true);
	}

	/**
	 * Frees @metrics.
	 */
	public void free()
	{
		soup_message_metrics_free(soupMessageMetrics);
		ownedRef = false;
	}

	/**
	 * Get the time immediately after the [class@Message] completed the
	 * connection to the server. This includes the time for the proxy
	 * negotiation and TLS handshake.
	 *
	 * It will be 0 if no network connection was required to fetch the resource (a
	 * persistent connection was used or resource was loaded from the local disk
	 * cache).
	 *
	 * Returns: the connection end time
	 */
	public ulong getConnectEnd()
	{
		return soup_message_metrics_get_connect_end(soupMessageMetrics);
	}

	/**
	 * Get the time immediately before the [class@Message] started to
	 * establish the connection to the server.
	 *
	 * It will be 0 if no network connection was required to fetch the resource (a
	 * persistent connection was used or resource was loaded from the local disk
	 * cache).
	 *
	 * Returns: the connection start time
	 */
	public ulong getConnectStart()
	{
		return soup_message_metrics_get_connect_start(soupMessageMetrics);
	}

	/**
	 * Get the time immediately after the [class@Message] completed the
	 * domain lookup name for the resource.
	 *
	 * It will be 0 if no domain lookup was required to fetch the resource (a
	 * persistent connection was used or resource was loaded from the local disk
	 * cache).
	 *
	 * Returns: the domain lookup end time
	 */
	public ulong getDnsEnd()
	{
		return soup_message_metrics_get_dns_end(soupMessageMetrics);
	}

	/**
	 * Get the time immediately before the [class@Message] started the
	 * domain lookup name for the resource.
	 *
	 * It will be 0 if no domain lookup was required to fetch the resource (a
	 * persistent connection was used or resource was loaded from the local disk
	 * cache).
	 *
	 * Returns: the domain lookup start time
	 */
	public ulong getDnsStart()
	{
		return soup_message_metrics_get_dns_start(soupMessageMetrics);
	}

	/**
	 * Get the time immediately before the [class@Message] started to
	 * fetch a resource either from a remote server or local disk cache.
	 *
	 * Returns: the fetch start time
	 */
	public ulong getFetchStart()
	{
		return soup_message_metrics_get_fetch_start(soupMessageMetrics);
	}

	/**
	 * Get the number of bytes sent to the network for the request body.
	 *
	 * This is the size of the body sent, after encodings are applied, so it might
	 * be greater than the value returned by
	 * [method@MessageMetrics.get_request_body_size]. This value is available right
	 * before [signal@Message::wrote-body] signal is emitted, but you might get an
	 * intermediate value if called before.
	 *
	 * Returns: the request body bytes sent
	 */
	public ulong getRequestBodyBytesSent()
	{
		return soup_message_metrics_get_request_body_bytes_sent(soupMessageMetrics);
	}

	/**
	 * Get the request body size in bytes. This is the size of the original body
	 * given to the request before any encoding is applied.
	 *
	 * This value is available right before [signal@Message::wrote-body] signal is
	 * emitted, but you might get an intermediate value if called before.
	 *
	 * Returns: the request body size
	 */
	public ulong getRequestBodySize()
	{
		return soup_message_metrics_get_request_body_size(soupMessageMetrics);
	}

	/**
	 * Get the number of bytes sent to the network for the request headers.
	 *
	 * This value is available right before [signal@Message::wrote-headers] signal
	 * is emitted, but you might get an intermediate value if called before.
	 *
	 * Returns: the request headers bytes sent
	 */
	public ulong getRequestHeaderBytesSent()
	{
		return soup_message_metrics_get_request_header_bytes_sent(soupMessageMetrics);
	}

	/**
	 * Get the time immediately before the [class@Message] started the
	 * request of the resource from the server or the local disk cache.
	 *
	 * Returns: the request start time
	 */
	public ulong getRequestStart()
	{
		return soup_message_metrics_get_request_start(soupMessageMetrics);
	}

	/**
	 * Get the number of bytes received from the network for the response body.
	 *
	 * This value is available right before [signal@Message::got-body] signal is
	 * emitted, but you might get an intermediate value if called before. For
	 * resources loaded from the disk cache this value is always 0.
	 *
	 * Returns: the response body bytes received
	 */
	public ulong getResponseBodyBytesReceived()
	{
		return soup_message_metrics_get_response_body_bytes_received(soupMessageMetrics);
	}

	/**
	 * Get the response body size in bytes.
	 *
	 * This is the size of the body as given to the user after all encodings are
	 * applied, so it might be greater than the value returned by
	 * [method@MessageMetrics.get_response_body_bytes_received]. This value is
	 * available right before [signal@Message::got-body] signal is emitted, but you
	 * might get an intermediate value if called before.
	 *
	 * Returns: the response body size
	 */
	public ulong getResponseBodySize()
	{
		return soup_message_metrics_get_response_body_size(soupMessageMetrics);
	}

	/**
	 * Get the time immediately after the [class@Message] received the last
	 * bytes of the response from the server or the local disk cache.
	 *
	 * In case of load failure, this returns the time immediately before the
	 * fetch is aborted.
	 *
	 * Returns: the response end time
	 */
	public ulong getResponseEnd()
	{
		return soup_message_metrics_get_response_end(soupMessageMetrics);
	}

	/**
	 * Get the number of bytes received from the network for the response headers.
	 *
	 * This value is available right before [signal@Message::got-headers] signal
	 * is emitted, but you might get an intermediate value if called before.
	 * For resources loaded from the disk cache this value is always 0.
	 *
	 * Returns: the response headers bytes received
	 */
	public ulong getResponseHeaderBytesReceived()
	{
		return soup_message_metrics_get_response_header_bytes_received(soupMessageMetrics);
	}

	/**
	 * Get the time immediately after the [class@Message] received the first
	 * bytes of the response from the server or the local disk cache.
	 *
	 * Returns: the response start time
	 */
	public ulong getResponseStart()
	{
		return soup_message_metrics_get_response_start(soupMessageMetrics);
	}

	/**
	 * Get the time immediately before the [class@Message] started the
	 * TLS handshake.
	 *
	 * It will be 0 if no TLS handshake was required to fetch the resource
	 * (connection was not secure, a persistent connection was used or resource was
	 * loaded from the local disk cache).
	 *
	 * Returns: the tls start time
	 */
	public ulong getTlsStart()
	{
		return soup_message_metrics_get_tls_start(soupMessageMetrics);
	}
}
