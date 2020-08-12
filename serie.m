function T = serie (P1, P2, alpha, beta, k, j, format="double")
  # Vamos a reutilizar la subserie en ambos términos
  #   Los términos factoriales y exponenciales se van de rango rápidamente si
  # los calculamos independientemente pero pueden cancelarse. Por eso vamos a
  # implementar cada subtérmino de la serie como un producto del término
  # anterior, arrancando desde un término inicial
  function s = subserie(P, n)
    if (format == "double")
      g = @(x) x;
    elseif (format == "single")
      g = @(x) redondeo(x, 23, 2, true);
    else
      error("Unrecognized format! Must be \"single\" or \"double\"");
    end
    # Memoizamos (P^2)/4 y aprovechamos para castearlo al tipo deseado
    P_2_4 = g(g(double(P * P)) / 4);
    # Primer término s_0
    a_k = g(P_2_4 / 2);
    s = a_k;
    for k = 1:n
      a_k = g(a_k*-g(P_2_4 / g(k * g(k + 2))));
      s = g(s + a_k);
    end
  end
  T = g(g(alpha * subserie(P1, k)) + g(beta * subserie(P2, j)));
end
