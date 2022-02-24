package br.com.qyosky.louja.controller;

import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.qyosky.louja.dao.ConnectionFactory;
import br.com.qyosky.louja.dao.UsuarioDao;
import br.com.qyosky.louja.model.Usuario;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String index() {
		ConnectionFactory.conectar();

		return "redirect:dashboard";
	}

	@RequestMapping("dashboard")
	public String dashboard(Model model) {
		UsuarioDao d = new UsuarioDao();
		List<Calendar> c = d.dates();
		int dom = 0, seg = 0, terc = 0, quar = 0, quin = 0, sex = 0, sab = 0;
		for (Calendar res : c) {
			int i = res.get(Calendar.SATURDAY);
			
			if(i == 1) {
				dom += 1;
			}else if(i == 2) {
				seg += 1;
			}else if(i == 3) {
				terc += 1;
			}else if(i == 4) {
				quar += 1;
			} else if(i == 5) {
				quin += 1;
			} else if(i ==6) {
				sex += 1;
			} else {
				sab += 1;
			}
		}
		
		model.addAttribute("dom", dom);
		model.addAttribute("seg", seg);
		model.addAttribute("terc", terc);
		model.addAttribute("quar", quar);
		model.addAttribute("quin", quin);
		model.addAttribute("sex", sex);
		model.addAttribute("sab", sab);
		
		model.addAttribute("adulto", adulto(d.idade()));
		model.addAttribute("idoso", idoso(d.idade()));
		model.addAttribute("jovem", jovem(d.idade()));
		model.addAttribute("tT", d.all());
		
		model.addAttribute("noite", noite(d.hora()));
		model.addAttribute("tarde", tarde(d.hora()));
		model.addAttribute("manha", manha(d.hora()));
		model.addAttribute("dValue", d.masculino());
		model.addAttribute("fValue", d.feminino());
		model.addAttribute("nValue", d.nValue());
		model.addAttribute("data", d.data());
		return "dashboard";
	}

	@RequestMapping("novoCliente")
	public String novoUsuario() {
		return "novoUsuario";
	}

	@RequestMapping(value = "inserirNovoUsuario", method = RequestMethod.POST)
	public String adiciona(Usuario u) {
		UsuarioDao dao = new UsuarioDao();
		dao.inserir(u);

		return "redirect:verCliente";
	}

	@RequestMapping("deletaUsuario")
	public String deletaUser(long idUser) {
		System.out.println("passou aqui");
		System.out.println(idUser);

		UsuarioDao dao = new UsuarioDao();
		dao.excluir(idUser);

		return "redirect:verCliente";
	}

	@RequestMapping("verCliente")
	public String verUser(Model model) {
		UsuarioDao dao = new UsuarioDao();

		model.addAttribute("usuarios", dao.vTudo());
		return "verUsuario";
	}

	@RequestMapping("editarUsuario")
	public String editar(long idUsuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		model.addAttribute("usuario", dao.search(idUsuario));

		return "forward:novoCliente";
	}
	
	@RequestMapping(value = "atualizarUsuario", method = RequestMethod.POST)
	public String atualiza(Long idUsuario, Usuario u) {
		UsuarioDao dao = new UsuarioDao();
		dao.atualizar(u, idUsuario);
		
		return "redirect:verCliente";
	}
	
	public int manha(List<Integer> l) {
		int n = 0;
		for (Integer value : l) {
			if (value < 12) {
				n += 1;
			}
		}
		return n;
	}

	public int tarde(List<Integer> l) {
		int n = 0;
		for (Integer value : l) {
			if (value < 18 && value > 12) {
				n += 1;
			}
		}
		return n;
	}

	public int noite(List<Integer> l) {
		int n = 0;
		for (Integer v : l) {
			if (v >= 18) {
				n += 1;
			}
		}
		return n;
	}

	public int jovem(List<Calendar> cld) {
		int n = 0;
		
		for (Calendar value : cld) {
			int dia = value.get(Calendar.DAY_OF_MONTH);
			int mes = value.get(Calendar.MONTH);
			int ano = value.get(Calendar.YEAR);

			LocalDate dataNasc = LocalDate.of(ano, mes + 1, dia);
			LocalDate dataAtual = LocalDate.now();
			Period periodo = Period.between(dataNasc, dataAtual);
			
			if(periodo.getYears() <= 18 || periodo.getYears() == 0) {
				n += 1;
			}
		}
		return n;
	} 
	
	public int adulto(List<Calendar> cld) {
		int n = 0;
		
		for (Calendar value : cld) {
			int dia = value.get(Calendar.DAY_OF_MONTH);
			int mes = value.get(Calendar.MONTH);
			int ano = value.get(Calendar.YEAR);

			LocalDate dataNasc = LocalDate.of(ano, mes + 1, dia);
			LocalDate dataAtual = LocalDate.now();
			Period periodo = Period.between(dataNasc, dataAtual);
			
			if(periodo.getYears() > 18 && periodo.getYears() < 60) {
				n += 1;
			}
		}
		return n;
	}
	
	public int idoso(List<Calendar> cld) {
		int n = 0;
		
		for (Calendar value : cld) {
			int dia = value.get(Calendar.DAY_OF_MONTH);
			int mes = value.get(Calendar.MONTH);
			int ano = value.get(Calendar.YEAR);

			LocalDate dataNasc = LocalDate.of(ano, mes + 1, dia);
			LocalDate dataAtual = LocalDate.now();
			Period periodo = Period.between(dataNasc, dataAtual);
			
			if(periodo.getYears() > 60) {
				n += 1;
			}
		}
		return n;
	}
}
